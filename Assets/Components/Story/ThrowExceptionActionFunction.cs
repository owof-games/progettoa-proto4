using System;
using LemuRivolta.InkAtoms.ExternalFunctionProcessors;

public class InternalStoryException : Exception
{
    public InternalStoryException()
    {
    }

    public InternalStoryException(string message) : base(message)
    {
    }

    public InternalStoryException(string message, Exception inner) : base(message, inner)
    {
    }
}

public class ThrowExceptionActionFunction : ActionExternalFunctionProcessor
{
    public ThrowExceptionActionFunction() : base("throw_exception")
    {
    }

    protected override void Process(ExternalFunctionProcessorContext context)
    {
        throw new InternalStoryException(context[0] as string);
    }
}