using System.Collections;
using TMPro;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Components.Dialogue
{
    public class SingleChoice : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
    {
        [SerializeField] private RectTransform rectTransform;

        [SerializeField] private float sizeDelta;

        [SerializeField] private TextMeshProUGUI text;

        [SerializeField] private LayoutElement layoutElement;
        [SerializeField] private Animator animator;

        [SerializeField] private UnityEvent onClick;
        private int _hoveredHash = -1;

        private void Awake()
        {
            _hoveredHash = Animator.StringToHash("Hovered");
        }

        private IEnumerator Start()
        {
            yield return null;

            SetHeight();
        }

        public void OnPointerEnter(PointerEventData eventData)
        {
            animator.SetBool(_hoveredHash, true);
        }

        public void OnPointerExit(PointerEventData eventData)
        {
            animator.SetBool(_hoveredHash, false);
        }

        private void SetHeight()
        {
            var height = LayoutUtility.GetPreferredHeight(text.rectTransform);
            layoutElement.preferredHeight = height;
        }

        public void SetText(string text)
        {
            this.text.text = text; // yeah ok right
            SetHeight();
        }

        public void Register(UnityAction onClickAction)
        {
            onClick.AddListener(onClickAction);
        }

        public void OnClick()
        {
            onClick?.Invoke();
        }

        public void Focus()
        {
            EventSystem.current.SetSelectedGameObject(gameObject);
        }
    }
}