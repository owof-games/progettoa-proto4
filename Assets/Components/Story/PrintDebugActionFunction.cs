using LemuRivolta.InkAtoms.ExternalFunctionProcessors;
using UnityEngine;

namespace Components.Story
{
    public class PrintDebugActionFunction : ActionExternalFunctionProcessor
    {
        public PrintDebugActionFunction() : base("print_debug")
        {
        }

        protected override void Process(ExternalFunctionProcessorContext context)
        {
            Debug.Log($"Ink Debug: {context[0]}");
        }
    }
}