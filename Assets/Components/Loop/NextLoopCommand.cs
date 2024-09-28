using System.Collections;
using LemuRivolta.InkAtoms.CommandLineProcessors;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;

namespace Components.Loop
{
    public class NextLoopCommand : CoroutineCommandLineProcessor
    {
        [SerializeField] private IntVariable loopNumber;
    
        public NextLoopCommand() : base("next-loop") { }

        private void Awake()
        {
            Assert.IsNotNull(loopNumber);
        }

        protected override IEnumerator Process(CommandLineProcessorContext context)
        {
            loopNumber.Value += 1;
            yield return null;
        }
    }
}