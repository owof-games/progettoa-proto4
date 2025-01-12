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

        public static string RemoteLoggerUrl =
            "https://game-logger.foxthesystem.space/api/logs/{gameName}/{version}/{saveGuid}/{sessionGuid}";

        public static string SessionGuid { get; } = Guid.NewGuid().ToString();

        public static async ValueTask Log(string message, IEnumerable<(string, string)> metadata, string category)
        {
            // create the JSON for the log entry
            var logEntry = new LogEntry
            {
                message = message,
                category = category,
                metadata = metadata.Select(entry =>
                    new LogEntryMetadata { key = entry.Item1, value = entry.Item2 }).ToArray()
            };
            var json = JsonUtility.ToJson(logEntry);
            var jsonToSend = Encoding.UTF8.GetBytes(json);

            // create the web request
            var url = RemoteLoggerUrl
                .Replace("{gameName}", Application.productName)
                .Replace("{version}", Application.version)
                .Replace("{saveGuid}", SessionGuid)
                .Replace("{sessionGuid}", SessionGuid);
            var unityWebRequest = new UnityWebRequest(url, "POST");
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
            public string category;

            // ReSharper disable once InconsistentNaming
            public LogEntryMetadata[] metadata;
        }

        [Serializable]
        private struct LogEntryMetadata
        {
            public string key;
            public string value;
        }
    }
}