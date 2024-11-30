using System.Threading;
using Cysharp.Threading.Tasks;
using UnityAtoms;

namespace Components
{
    public static class AtomsExt
    {
        /// <summary>
        ///     Create a task that resolves once the event is raised the first time.
        /// </summary>
        /// <param name="atomEvent">The event to listen to.</param>
        /// <param name="cancellationToken">A cancellation token, to stop the listening process.</param>
        /// <typeparam name="T">The type of the atom event.</typeparam>
        /// <returns>A task that gets resolved once the event is raised the first time.</returns>
        public static UniTask<T> ToUniTask<T>(this AtomEvent<T> atomEvent,
            CancellationToken cancellationToken = default)
        {
            var listener = new AtomListener<T>(atomEvent, cancellationToken);
            return listener.UniTask;
        }

        private class AtomListener<T> : IAtomListener<T>
        {
            private readonly AtomEvent<T> _atomEvent;
            private readonly CancellationToken _cancellationToken;
            private readonly UniTaskCompletionSource<T> _uniTaskCompletionSource;

            public AtomListener(AtomEvent<T> atomEvent, CancellationToken cancellationToken)
            {
                _atomEvent = atomEvent;
                _cancellationToken = cancellationToken;
                _uniTaskCompletionSource = new UniTaskCompletionSource<T>();
                atomEvent.RegisterListener(this);
                cancellationToken.Register(OnCanceled);
            }

            public UniTask<T> UniTask => _uniTaskCompletionSource.Task;

            public void OnEventRaised(T result)
            {
                _atomEvent.UnregisterListener(this);
                _uniTaskCompletionSource.TrySetResult(result);
            }

            private void OnCanceled()
            {
                _atomEvent.UnregisterListener(this);
                _uniTaskCompletionSource.TrySetCanceled(_cancellationToken);
            }
        }
    }
}