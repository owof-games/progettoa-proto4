using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Cysharp.Threading.Tasks;
using UnityEngine;
using UnityEngine.Networking;

namespace Components.RemoteLogger
{
    public static class RemoteLogger
    {
        public const string GameName = "Loop Proto 4";
        private static string _sessionGuid;

        public static string SessionGuid
        {
            get
            {
                _sessionGuid ??= Guid.NewGuid().ToString();
                return _sessionGuid;
            }
        }

        public static async ValueTask Log(string message, IEnumerable<(string, string)> metadata)
        {
            var sessionGuid = SessionGuid;

            var formData = new List<IMultipartFormSection>
            {
                new MultipartFormDataSection("message", message),
                new MultipartFormDataSection("gameName", GameName),
                new MultipartFormDataSection("version", Application.version),
                new MultipartFormDataSection("sessionGuid", sessionGuid)
            };
            formData.AddRange(metadata.Select(entry =>
                new MultipartFormDataSection(entry.Item1,
                    string.IsNullOrEmpty(entry.Item2) ? "<<<empty>>>" : entry.Item2)));

            await UniTask.SwitchToMainThread();
            var unityWebRequest = UnityWebRequest.Post("https://game-logger.foxthesystem.space", formData);
            // var unityWebRequest = UnityWebRequest.Post("http://localhost:9283", formData);
            await unityWebRequest.SendWebRequest();
            if (unityWebRequest.result != UnityWebRequest.Result.Success)
                throw new Exception(
                    $"Web request to record logs failed: {unityWebRequest.error} - {unityWebRequest.downloadHandler.text}");
        }
    }
}