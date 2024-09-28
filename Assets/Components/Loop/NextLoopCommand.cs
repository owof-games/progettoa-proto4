using System;
using System.Collections;
using LemuRivolta.InkAtoms.CommandLineProcessors;

public class NextLoopCommand : CoroutineCommandLineProcessor
{
    public NextLoopCommand() : base("NextLoopCommand") { }

    protected override IEnumerator Process(CommandLineProcessorContext context)
    {
        throw new NotImplementedException();
    }
}