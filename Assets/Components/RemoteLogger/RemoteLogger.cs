using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cysharp.Threading.Tasks;
using UnityEngine;
using UnityEngine.Networking;

namespace Components.RemoteLogger
{
    public static class RemoteLogger
    {
        public const string GameName = "Loop Proto 4";
        public static string RemoteLoggerUrl = "https://game-logger.foxthesystem.space";

        public static string SessionGuid { get; } = Guid.NewGuid().ToString();

        public static async ValueTask Log(string message, IEnumerable<(string, string)> metadata)
        {
            // var formData = new List<IMultipartFormSection>
            // {
            //     new MultipartFormDataSection("message", message),
            //     new MultipartFormDataSection("gameName", GameName),
            //     new MultipartFormDataSection("version", Application.version),
            //     new MultipartFormDataSection("sessionGuid", sessionGuid)
            // };
            // formData.AddRange(metadata.Select(entry =>
            //     new MultipartFormDataSection(
            //         string.IsNullOrEmpty(entry.Item2) ? "-" + entry.Item1 : entry.Item1,
            //         string.IsNullOrEmpty(entry.Item2) ? "<<<empty>>>" : entry.Item2)));

            // create the JSON for the log entry
            var logEntry = new LogEntry
            {
                message = message,
                gameName = GameName,
                version = Application.version,
                saveGuid = "",
                sessionGuid = SessionGuid,
                metadata = metadata.Select(entry => new[] { entry.Item1, entry.Item2 }).ToArray()
            };
            var json = JsonUtility.ToJson(logEntry);
            var jsonToSend = Encoding.UTF8.GetBytes(json);

            // create the web request
            var unityWebRequest = new UnityWebRequest(RemoteLoggerUrl, "POST");
            unityWebRequest.uploadHandler = new UploadHandlerRaw(jsonToSend);
            unityWebRequest.downloadHandler = new DownloadHandlerBuffer();
            unityWebRequest.SetRequestHeader("Content-Type", "application/json");

            // send it
            await UniTask.SwitchToMainThread();
            await unityWebRequest.SendWebRequest();
            if (unityWebRequest.result != UnityWebRequest.Result.Success)
                throw new Exception(
                    $"Web request to record logs failed: {unityWebRequest.error} - {unityWebRequest.downloadHandler.text}");
        }

        [Serializable]
        private struct LogEntry
        {
            public string message;
            public string gameName;
            public string version;
            public string saveGuid;
            public string sessionGuid;

            // ReSharper disable once InconsistentNaming
            public string[][] metadata;
        }
    }
}