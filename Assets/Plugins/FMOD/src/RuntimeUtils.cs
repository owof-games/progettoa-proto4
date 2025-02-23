using System;
using System.Collections.Generic;
using FMOD;
using FMOD.Studio;
using UnityEngine;
using Debug = UnityEngine.Debug;
using GUID = FMOD.GUID;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace FMOD
{
    [Serializable]
    public partial struct GUID : IEquatable<GUID>
    {
        public GUID(Guid guid)
        {
            byte[] bytes = guid.ToByteArray();

            Data1 = BitConverter.ToInt32(bytes, 0);
            Data2 = BitConverter.ToInt32(bytes, 4);
            Data3 = BitConverter.ToInt32(bytes, 8);
            Data4 = BitConverter.ToInt32(bytes, 12);
        }

        public static GUID Parse(string s)
        {
            return new GUID(new Guid(s));
        }

        public bool IsNull
        {
            get
            {
                return Data1 == 0
                       && Data2 == 0
                       && Data3 == 0
                       && Data4 == 0;
            }
        }

        public override bool Equals(object other)
        {
            return (other is GUID) && Equals((GUID)other);
        }

        public bool Equals(GUID other)
        {
            return Data1 == other.Data1
                   && Data2 == other.Data2
                   && Data3 == other.Data3
                   && Data4 == other.Data4;
        }

        public static bool operator ==(GUID a, GUID b)
        {
            return a.Equals(b);
        }

        public static bool operator !=(GUID a, GUID b)
        {
            return !a.Equals(b);
        }

        public override int GetHashCode()
        {
            return Data1 ^ Data2 ^ Data3 ^ Data4;
        }

        public static implicit operator Guid(GUID guid)
        {
            return new Guid(guid.Data1,
                (short)((guid.Data2 >> 0) & 0xFFFF),
                (short)((guid.Data2 >> 16) & 0xFFFF),
                (byte)((guid.Data3 >> 0) & 0xFF),
                (byte)((guid.Data3 >> 8) & 0xFF),
                (byte)((guid.Data3 >> 16) & 0xFF),
                (byte)((guid.Data3 >> 24) & 0xFF),
                (byte)((guid.Data4 >> 0) & 0xFF),
                (byte)((guid.Data4 >> 8) & 0xFF),
                (byte)((guid.Data4 >> 16) & 0xFF),
                (byte)((guid.Data4 >> 24) & 0xFF)
            );
        }

        public override string ToString()
        {
            return ((Guid)this).ToString("B");
        }
    }
}

namespace FMODUnity
{
    public class EventNotFoundException : Exception
    {
        public GUID Guid;
        public string Path;

        public EventNotFoundException(string path)
            : base("[FMOD] Event not found: '" + path + "'")
        {
            Path = path;
        }

        public EventNotFoundException(GUID guid)
            : base("[FMOD] Event not found: " + guid)
        {
            Guid = guid;
        }

        public EventNotFoundException(EventReference eventReference)
            : base("[FMOD] Event not found: " + eventReference.ToString())
        {
            Guid = eventReference.Guid;

#if UNITY_EDITOR
            Path = eventReference.Path;
#endif
        }
    }

    public class BusNotFoundException : Exception
    {
        public string Path;

        public BusNotFoundException(string path)
            : base("[FMOD] Bus not found '" + path + "'")
        {
            Path = path;
        }
    }

    public class VCANotFoundException : Exception
    {
        public string Path;

        public VCANotFoundException(string path)
            : base("[FMOD] VCA not found '" + path + "'")
        {
            Path = path;
        }
    }

    public class BankLoadException : Exception
    {
        public string Path;
        public RESULT Result;

        public BankLoadException(string path, RESULT result)
            : base(string.Format("[FMOD] Could not load bank '{0}' : {1} : {2}", path, result.ToString(),
                Error.String(result)))
        {
            Path = path;
            Result = result;
        }

        public BankLoadException(string path, string error)
            : base(string.Format("[FMOD] Could not load bank '{0}' : {1}", path, error))
        {
            Path = path;
            Result = RESULT.ERR_INTERNAL;
        }
    }

    public class SystemNotInitializedException : Exception
    {
        public string Location;
        public RESULT Result;

        public SystemNotInitializedException(RESULT result, string location)
            : base(string.Format("[FMOD] Initialization failed : {2} : {0} : {1}", result.ToString(),
                Error.String(result), location))
        {
            Result = result;
            Location = location;
        }

        public SystemNotInitializedException(Exception inner)
            : base("[FMOD] Initialization failed", inner)
        {
        }
    }

    public enum EmitterGameEvent : int
    {
        None,
        ObjectStart,
        ObjectDestroy,
        TriggerEnter,
        TriggerExit,
        TriggerEnter2D,
        TriggerExit2D,
        CollisionEnter,
        CollisionExit,
        CollisionEnter2D,
        CollisionExit2D,
        ObjectEnable,
        ObjectDisable,
        ObjectMouseEnter,
        ObjectMouseExit,
        ObjectMouseDown,
        ObjectMouseUp,
        UIMouseEnter,
        UIMouseExit,
        UIMouseDown,
        UIMouseUp,
    }

    public enum LoaderGameEvent : int
    {
        None,
        ObjectStart,
        ObjectDestroy,
        TriggerEnter,
        TriggerExit,
        TriggerEnter2D,
        TriggerExit2D,
        ObjectEnable,
        ObjectDisable,
    }

    // We use our own enum to avoid serialization issues if FMOD.THREAD_TYPE changes
    public enum ThreadType
    {
        Mixer,
        Feeder,
        Stream,
        File,
        Nonblocking,
        Record,
        Geometry,
        Profiler,
        Studio_Update,
        Studio_Load_Bank,
        Studio_Load_Sample,
        Convolution_1,
        Convolution_2,
    }

    // We use our own enum to avoid serialization issues if FMOD.THREAD_AFFINITY changes
    [Flags]
    public enum ThreadAffinity : uint
    {
        Any = 0,
        Core0 = 1 << 0,
        Core1 = 1 << 1,
        Core2 = 1 << 2,
        Core3 = 1 << 3,
        Core4 = 1 << 4,
        Core5 = 1 << 5,
        Core6 = 1 << 6,
        Core7 = 1 << 7,
        Core8 = 1 << 8,
        Core9 = 1 << 9,
        Core10 = 1 << 10,
        Core11 = 1 << 11,
        Core12 = 1 << 12,
        Core13 = 1 << 13,
        Core14 = 1 << 14,
        Core15 = 1 << 15,
    }

    // Using a separate enum to avoid serialization issues if FMOD.SOUND_TYPE changes.
    public enum CodecType : int
    {
        FADPCM,
        Vorbis,
        AT9,
        XMA,
        Opus
    }

    [Serializable]
    public class ThreadAffinityGroup
    {
        public List<ThreadType> threads = new List<ThreadType>();
        public ThreadAffinity affinity = ThreadAffinity.Any;

        public ThreadAffinityGroup()
        {
        }

        public ThreadAffinityGroup(ThreadAffinityGroup other)
        {
            threads = new List<ThreadType>(other.threads);
            affinity = other.affinity;
        }

        public ThreadAffinityGroup(ThreadAffinity affinity, params ThreadType[] threads)
        {
            this.threads = new List<ThreadType>(threads);
            this.affinity = affinity;
        }
    }

    [Serializable]
    public class CodecChannelCount
    {
        public CodecType format;
        public int channels;

        public CodecChannelCount()
        {
        }

        public CodecChannelCount(CodecChannelCount other)
        {
            format = other.format;
            channels = other.channels;
        }
    }

    public static class RuntimeUtils
    {
        public static string GetCommonPlatformPath(string path)
        {
            if (string.IsNullOrEmpty(path))
            {
                return path;
            }

            return path.Replace('\\', '/');
        }

        public static VECTOR ToFMODVector(this Vector3 vec)
        {
            VECTOR temp;
            temp.x = vec.x;
            temp.y = vec.y;
            temp.z = vec.z;

            return temp;
        }

        public static ATTRIBUTES_3D To3DAttributes(this Vector3 pos)
        {
            ATTRIBUTES_3D attributes = new ATTRIBUTES_3D();
            attributes.forward = ToFMODVector(Vector3.forward);
            attributes.up = ToFMODVector(Vector3.up);
            attributes.position = ToFMODVector(pos);

            return attributes;
        }

        public static ATTRIBUTES_3D To3DAttributes(this Transform transform)
        {
            ATTRIBUTES_3D attributes = new ATTRIBUTES_3D();
            attributes.forward = transform.forward.ToFMODVector();
            attributes.up = transform.up.ToFMODVector();
            attributes.position = transform.position.ToFMODVector();

            return attributes;
        }

        public static ATTRIBUTES_3D To3DAttributes(this Transform transform, Vector3 velocity)
        {
            ATTRIBUTES_3D attributes = new ATTRIBUTES_3D();
            attributes.forward = transform.forward.ToFMODVector();
            attributes.up = transform.up.ToFMODVector();
            attributes.position = transform.position.ToFMODVector();
            attributes.velocity = velocity.ToFMODVector();

            return attributes;
        }

        public static ATTRIBUTES_3D To3DAttributes(this GameObject go)
        {
            return go.transform.To3DAttributes();
        }

        public static THREAD_TYPE ToFMODThreadType(ThreadType threadType)
        {
            switch (threadType)
            {
                case ThreadType.Mixer:
                    return THREAD_TYPE.MIXER;
                case ThreadType.Feeder:
                    return THREAD_TYPE.FEEDER;
                case ThreadType.Stream:
                    return THREAD_TYPE.STREAM;
                case ThreadType.File:
                    return THREAD_TYPE.FILE;
                case ThreadType.Nonblocking:
                    return THREAD_TYPE.NONBLOCKING;
                case ThreadType.Record:
                    return THREAD_TYPE.RECORD;
                case ThreadType.Geometry:
                    return THREAD_TYPE.GEOMETRY;
                case ThreadType.Profiler:
                    return THREAD_TYPE.PROFILER;
                case ThreadType.Studio_Update:
                    return THREAD_TYPE.STUDIO_UPDATE;
                case ThreadType.Studio_Load_Bank:
                    return THREAD_TYPE.STUDIO_LOAD_BANK;
                case ThreadType.Studio_Load_Sample:
                    return THREAD_TYPE.STUDIO_LOAD_SAMPLE;
                case ThreadType.Convolution_1:
                    return THREAD_TYPE.CONVOLUTION1;
                case ThreadType.Convolution_2:
                    return THREAD_TYPE.CONVOLUTION2;
                default:
                    throw new ArgumentException("Unrecognised thread type '" + threadType.ToString() + "'");
            }
        }

        public static string DisplayName(this ThreadType thread)
        {
            return thread.ToString().Replace('_', ' ');
        }

        public static THREAD_AFFINITY ToFMODThreadAffinity(ThreadAffinity affinity)
        {
            THREAD_AFFINITY fmodAffinity = THREAD_AFFINITY.CORE_ALL;

            SetFMODAffinityBit(affinity, ThreadAffinity.Core0, THREAD_AFFINITY.CORE_0, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core1, THREAD_AFFINITY.CORE_1, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core2, THREAD_AFFINITY.CORE_2, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core3, THREAD_AFFINITY.CORE_3, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core4, THREAD_AFFINITY.CORE_4, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core5, THREAD_AFFINITY.CORE_5, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core6, THREAD_AFFINITY.CORE_6, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core7, THREAD_AFFINITY.CORE_7, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core8, THREAD_AFFINITY.CORE_8, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core9, THREAD_AFFINITY.CORE_9, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core10, THREAD_AFFINITY.CORE_10, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core11, THREAD_AFFINITY.CORE_11, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core12, THREAD_AFFINITY.CORE_12, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core13, THREAD_AFFINITY.CORE_13, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core14, THREAD_AFFINITY.CORE_14, ref fmodAffinity);
            SetFMODAffinityBit(affinity, ThreadAffinity.Core15, THREAD_AFFINITY.CORE_15, ref fmodAffinity);

            return fmodAffinity;
        }

        private static void SetFMODAffinityBit(ThreadAffinity affinity, ThreadAffinity mask,
            THREAD_AFFINITY fmodMask, ref THREAD_AFFINITY fmodAffinity)
        {
            if ((affinity & mask) != 0)
            {
                fmodAffinity |= fmodMask;
            }
        }

        public static void EnforceLibraryOrder()
        {
            // Call a function in fmod.dll to make sure it's loaded before fmodstudio.dll
            int temp1, temp2;
            Memory.GetStats(out temp1, out temp2);

            GUID temp3;
            Util.parseID("", out temp3);
        }

        public static void DebugLog(string message)
        {
            if (!Settings.IsInitialized() || Settings.Instance.LoggingLevel == DEBUG_FLAGS.LOG)
            {
                Debug.Log(message);
            }
        }

        public static void DebugLogFormat(string format, params object[] args)
        {
            if (!Settings.IsInitialized() || Settings.Instance.LoggingLevel == DEBUG_FLAGS.LOG)
            {
                Debug.LogFormat(format, args);
            }
        }

        public static void DebugLogWarning(string message)
        {
            if (!Settings.IsInitialized() || Settings.Instance.LoggingLevel >= DEBUG_FLAGS.WARNING)
            {
                Debug.LogWarning(message);
            }
        }

        public static void DebugLogWarningFormat(string format, params object[] args)
        {
            if (!Settings.IsInitialized() || Settings.Instance.LoggingLevel >= DEBUG_FLAGS.WARNING)
            {
                Debug.LogWarningFormat(format, args);
            }
        }

        public static void DebugLogError(string message)
        {
            if (!Settings.IsInitialized() || Settings.Instance.LoggingLevel >= DEBUG_FLAGS.ERROR)
            {
                Debug.LogError(message);
            }
        }

        public static void DebugLogErrorFormat(string format, params object[] args)
        {
            if (!Settings.IsInitialized() || Settings.Instance.LoggingLevel >= DEBUG_FLAGS.ERROR)
            {
                Debug.LogErrorFormat(format, args);
            }
        }

        public static void DebugLogException(Exception e)
        {
            if (!Settings.IsInitialized() || Settings.Instance.LoggingLevel >= DEBUG_FLAGS.ERROR)
            {
                Debug.LogException(e);
            }
        }

#if UNITY_EDITOR
        public static string WritableAssetPath(string subPath)
        {
            if (PluginBasePath.StartsWith("Assets/"))
            {
                return $"{PluginBasePath}/{subPath}.asset";
            }
            else
            {
                return $"Assets/Plugins/FMOD/{subPath}.asset";
            }
        }
#endif
#if UNITY_EDITOR
        private static string pluginBasePath;

        public const string BaseFolderGUID = "06ae579381df01a4a87bb149dec89954";
        public const string PluginBasePathDefault = "Assets/Plugins/FMOD";

        public static string PluginBasePath
        {
            get
            {
                if (pluginBasePath == null)
                {
                    pluginBasePath = AssetDatabase.GUIDToAssetPath(BaseFolderGUID);

                    if (string.IsNullOrEmpty(pluginBasePath))
                    {
                        pluginBasePath = PluginBasePathDefault;

                        DebugLogWarningFormat("FMOD: Couldn't find base folder with GUID {0}; defaulting to {1}",
                            BaseFolderGUID, pluginBasePath);
                    }
                }

                return pluginBasePath;
            }
        }
#endif

#if UNITY_PHYSICS_EXIST
        public static ATTRIBUTES_3D To3DAttributes(Transform transform, Rigidbody rigidbody = null)
        {
            ATTRIBUTES_3D attributes = transform.To3DAttributes();

            if (rigidbody)
            {
#if UNITY_6000_0_OR_NEWER
                attributes.velocity = rigidbody.linearVelocity.ToFMODVector();
#else
                attributes.velocity = rigidbody.velocity.ToFMODVector();
#endif
            }

            return attributes;
        }

        public static ATTRIBUTES_3D To3DAttributes(GameObject go, Rigidbody rigidbody)
        {
            ATTRIBUTES_3D attributes = go.transform.To3DAttributes();

            if (rigidbody)
            {
#if UNITY_6000_0_OR_NEWER
                attributes.velocity = rigidbody.linearVelocity.ToFMODVector();
#else
                attributes.velocity = rigidbody.velocity.ToFMODVector();
#endif
            }

            return attributes;
        }
#endif

#if UNITY_PHYSICS2D_EXIST
        public static ATTRIBUTES_3D To3DAttributes(Transform transform, Rigidbody2D rigidbody)
        {
            ATTRIBUTES_3D attributes = transform.To3DAttributes();

            if (rigidbody)
            {
                VECTOR vel;
#if UNITY_6000_1_OR_NEWER
                vel.x = rigidbody.linearVelocity.x;
                vel.y = rigidbody.linearVelocity.y;
#else
#pragma warning disable CS0618
                vel.x = rigidbody.velocity.x;
                vel.y = rigidbody.velocity.y;
#pragma warning restore CS0618
#endif
                vel.z = 0;
                attributes.velocity = vel;
            }

            return attributes;
        }


        public static ATTRIBUTES_3D To3DAttributes(GameObject go, Rigidbody2D rigidbody)
        {
            ATTRIBUTES_3D attributes = go.transform.To3DAttributes();

            if (rigidbody)
            {
                VECTOR vel;
#if UNITY_6000_1_OR_NEWER
                vel.x = rigidbody.linearVelocity.x;
                vel.y = rigidbody.linearVelocity.y;
#else
#pragma warning disable CS0618
                vel.x = rigidbody.velocity.x;
                vel.y = rigidbody.velocity.y;
#pragma warning restore CS0618
#endif
                vel.z = 0;
                attributes.velocity = vel;
            }

            return attributes;
        }
#endif
    }
}