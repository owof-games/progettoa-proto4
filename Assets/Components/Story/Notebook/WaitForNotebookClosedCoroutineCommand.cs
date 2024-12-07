using System.Collections;
using Cysharp.Threading.Tasks;
using LemuRivolta.InkAtoms.CommandLineProcessors;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;

namespace Components.Story.Notebook
{
    public class WaitForNotebookClosedCoroutineCommand : CoroutineCommandLineProcessor
    {
        [SerializeField] private VoidEvent notebookFinished;
        [SerializeField] private VoidEvent onNotebookClosed;

        public WaitForNotebookClosedCoroutineCommand() : base("waitForNotebookClosed")
        {
        }

        private void Awake()
        {
            Assert.IsNotNull(notebookFinished);
            Assert.IsNotNull(onNotebookClosed);
        }

        protected override IEnumerator Process(CommandLineProcessorContext context)
        {
            notebookFinished.Raise();
            return onNotebookClosed.ToUniTask().ToCoroutine();
        }
    }
}