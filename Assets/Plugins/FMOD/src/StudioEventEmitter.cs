﻿using System;
using System.Collections.Generic;
using FMOD.Studio;
using UnityEngine;
using UnityEngine.Serialization;

namespace FMODUnity
{
    [AddComponentMenu("FMOD Studio/FMOD Studio Event Emitter")]
    public class StudioEventEmitter : EventHandler
    {
        private const string SnapshotString = "snapshot";

        private static List<StudioEventEmitter> activeEmitters = new List<StudioEventEmitter>();
        public EventReference EventReference;

        [Obsolete("Use the EventReference field instead.")]
        public string Event = "";

        [FormerlySerializedAs("PlayEvent")] public EmitterGameEvent EventPlayTrigger = EmitterGameEvent.None;

        [FormerlySerializedAs("StopEvent")] public EmitterGameEvent EventStopTrigger = EmitterGameEvent.None;

        public bool AllowFadeout = true;
        public bool TriggerOnce = false;
        public bool Preload = false;

        [FormerlySerializedAs("AllowNonRigidbodyDoppler")]
        public bool NonRigidbodyVelocity = false;

        public ParamRef[] Params = new ParamRef[0];
        public bool OverrideAttenuation = false;
        public float OverrideMinDistance = -1.0f;
        public float OverrideMaxDistance = -1.0f;
        private List<ParamRef> cachedParams = new List<ParamRef>();

        protected EventDescription eventDescription;

        private bool hasTriggered = false;

        protected EventInstance instance;
        private bool isOneshot = false;
        private bool isQuitting = false;

        public EmitterGameEvent PlayEvent
        {
            get { return EventPlayTrigger; }
            set { EventPlayTrigger = value; }
        }

        public EmitterGameEvent StopEvent
        {
            get { return EventStopTrigger; }
            set { EventStopTrigger = value; }
        }

        public EventDescription EventDescription
        {
            get { return eventDescription; }
        }

        public EventInstance EventInstance
        {
            get { return instance; }
        }

        public bool IsActive { get; private set; }

        private float MaxDistance
        {
            get
            {
                if (OverrideAttenuation)
                {
                    return OverrideMaxDistance;
                }

                if (!eventDescription.isValid())
                {
                    Lookup();
                }

                float minDistance, maxDistance;
                eventDescription.getMinMaxDistance(out minDistance, out maxDistance);
                return maxDistance;
            }
        }

        protected override void Start()
        {
            RuntimeUtils.EnforceLibraryOrder();
            if (Preload)
            {
                Lookup();
                eventDescription.loadSampleData();
            }

            HandleGameEvent(EmitterGameEvent.ObjectStart);

            // If a Rigidbody or Rigidbody2D is present on this GameObject, turn off "NonRigidbodyVelocity"
#if UNITY_PHYSICS_EXIST
            if (NonRigidbodyVelocity && GetComponent<Rigidbody>())
            {
                Debug.LogWarning(string.Format(
                    "[FMOD] Non-Rigidbody Velocity is enabled on Emitter attached to GameObject \"{0}\", which also has a Rigidbody component attached - this will be disabled in favor of velocity from Rigidbody component.",
                    this.name));
                NonRigidbodyVelocity = false;
            }
#endif
#if UNITY_PHYSICS2D_EXIST
            if (NonRigidbodyVelocity && GetComponent<Rigidbody2D>())
            {
                Debug.LogWarning(string.Format(
                    "[FMOD] Non-Rigidbody Velocity is enabled on Emitter attached to GameObject \"{0}\", which also has a Rigidbody2D component attached - this will be disabled in favor of velocity from Rigidbody2D component.",
                    this.name));
                NonRigidbodyVelocity = false;
            }
#endif
        }

        protected override void OnDestroy()
        {
            if (!isQuitting)
            {
                HandleGameEvent(EmitterGameEvent.ObjectDestroy);

                if (instance.isValid())
                {
                    RuntimeManager.DetachInstanceFromGameObject(instance);
                    if (eventDescription.isValid() && isOneshot)
                    {
                        instance.release();
                        instance.clearHandle();
                    }
                }

                DeregisterActiveEmitter(this);

                if (Preload)
                {
                    eventDescription.unloadSampleData();
                }
            }
        }

        private void OnApplicationQuit()
        {
            isQuitting = true;
        }

        public static void UpdateActiveEmitters()
        {
            foreach (StudioEventEmitter emitter in activeEmitters)
            {
                emitter.UpdatePlayingStatus();
            }
        }

        private static void RegisterActiveEmitter(StudioEventEmitter emitter)
        {
            if (!activeEmitters.Contains(emitter))
            {
                activeEmitters.Add(emitter);
            }
        }

        private static void DeregisterActiveEmitter(StudioEventEmitter emitter)
        {
            activeEmitters.Remove(emitter);
        }

        private void UpdatePlayingStatus(bool force = false)
        {
            // If at least one listener is within the max distance, ensure an event instance is playing
            bool playInstance = StudioListener.DistanceSquaredToNearestListener(transform.position) <=
                                (MaxDistance * MaxDistance);

            if (force || playInstance != IsPlaying())
            {
                if (playInstance)
                {
                    PlayInstance();
                }
                else
                {
                    StopInstance();
                }
            }
        }

        protected override void HandleGameEvent(EmitterGameEvent gameEvent)
        {
            if (EventPlayTrigger == gameEvent)
            {
                Play();
            }

            if (EventStopTrigger == gameEvent)
            {
                Stop();
            }
        }

        private void Lookup()
        {
            eventDescription = RuntimeManager.GetEventDescription(EventReference);

            if (eventDescription.isValid())
            {
                for (int i = 0; i < Params.Length; i++)
                {
                    PARAMETER_DESCRIPTION param;
                    eventDescription.getParameterDescriptionByName(Params[i].Name, out param);
                    Params[i].ID = param.id;
                }
            }
        }

        public void Play()
        {
            if (TriggerOnce && hasTriggered)
            {
                return;
            }

            if (EventReference.IsNull)
            {
                return;
            }

            cachedParams.Clear();

            if (!eventDescription.isValid())
            {
                Lookup();
            }

            bool isSnapshot;
            eventDescription.isSnapshot(out isSnapshot);

            if (!isSnapshot)
            {
                eventDescription.isOneshot(out isOneshot);
            }

            bool is3D;
            eventDescription.is3D(out is3D);

            IsActive = true;

            if (is3D && !isOneshot && Settings.Instance.StopEventsOutsideMaxDistance)
            {
                RegisterActiveEmitter(this);
                UpdatePlayingStatus(true);
            }
            else
            {
                PlayInstance();
            }
        }

        private void PlayInstance()
        {
            if (!instance.isValid())
            {
                instance.clearHandle();
            }

            // Let previous oneshot instances play out
            if (isOneshot && instance.isValid())
            {
                instance.release();
                instance.clearHandle();
            }

            bool is3D;
            eventDescription.is3D(out is3D);

            if (!instance.isValid())
            {
                eventDescription.createInstance(out instance);

                // Only want to update if we need to set 3D attributes
                if (is3D)
                {
                    var transform = GetComponent<Transform>();
#if UNITY_PHYSICS_EXIST
                    if (GetComponent<Rigidbody>())
                    {
                        Rigidbody rigidBody = GetComponent<Rigidbody>();
                        instance.set3DAttributes(RuntimeUtils.To3DAttributes(gameObject, rigidBody));
                        RuntimeManager.AttachInstanceToGameObject(instance, gameObject, rigidBody);
                    }
                    else
#endif
#if UNITY_PHYSICS2D_EXIST
                    if (GetComponent<Rigidbody2D>())
                    {
                        var rigidBody2D = GetComponent<Rigidbody2D>();
                        instance.set3DAttributes(RuntimeUtils.To3DAttributes(gameObject, rigidBody2D));
                        RuntimeManager.AttachInstanceToGameObject(instance, gameObject, rigidBody2D);
                    }
                    else
#endif
                    {
                        instance.set3DAttributes(RuntimeUtils.To3DAttributes(gameObject));
                        RuntimeManager.AttachInstanceToGameObject(instance, gameObject, NonRigidbodyVelocity);
                    }
                }
            }

            foreach (var param in Params)
            {
                instance.setParameterByID(param.ID, param.Value);
            }

            foreach (var cachedParam in cachedParams)
            {
                instance.setParameterByID(cachedParam.ID, cachedParam.Value);
            }

            if (is3D && OverrideAttenuation)
            {
                instance.setProperty(EVENT_PROPERTY.MINIMUM_DISTANCE, OverrideMinDistance);
                instance.setProperty(EVENT_PROPERTY.MAXIMUM_DISTANCE, OverrideMaxDistance);
            }

            instance.start();

            hasTriggered = true;
        }

        public void Stop()
        {
            DeregisterActiveEmitter(this);
            IsActive = false;
            cachedParams.Clear();
            StopInstance();
        }

        private void StopInstance()
        {
            if (TriggerOnce && hasTriggered)
            {
                DeregisterActiveEmitter(this);
            }

            if (instance.isValid())
            {
                instance.stop(AllowFadeout ? STOP_MODE.ALLOWFADEOUT : STOP_MODE.IMMEDIATE);
                instance.release();
                if (!AllowFadeout)
                {
                    instance.clearHandle();
                }
            }
        }

        public void SetParameter(string name, float value, bool ignoreseekspeed = false)
        {
            if (Settings.Instance.StopEventsOutsideMaxDistance && IsActive)
            {
                string findName = name;
                ParamRef cachedParam = cachedParams.Find(x => x.Name == findName);

                if (cachedParam == null)
                {
                    PARAMETER_DESCRIPTION paramDesc;
                    eventDescription.getParameterDescriptionByName(name, out paramDesc);

                    cachedParam = new ParamRef();
                    cachedParam.ID = paramDesc.id;
                    cachedParam.Name = paramDesc.name;
                    cachedParams.Add(cachedParam);
                }

                cachedParam.Value = value;
            }

            if (instance.isValid())
            {
                instance.setParameterByName(name, value, ignoreseekspeed);
            }
        }

        public void SetParameter(PARAMETER_ID id, float value, bool ignoreseekspeed = false)
        {
            if (Settings.Instance.StopEventsOutsideMaxDistance && IsActive)
            {
                PARAMETER_ID findId = id;
                ParamRef cachedParam = cachedParams.Find(x => x.ID.Equals(findId));

                if (cachedParam == null)
                {
                    PARAMETER_DESCRIPTION paramDesc;
                    eventDescription.getParameterDescriptionByID(id, out paramDesc);

                    cachedParam = new ParamRef();
                    cachedParam.ID = paramDesc.id;
                    cachedParam.Name = paramDesc.name;
                    cachedParams.Add(cachedParam);
                }

                cachedParam.Value = value;
            }

            if (instance.isValid())
            {
                instance.setParameterByID(id, value, ignoreseekspeed);
            }
        }

        public bool IsPlaying()
        {
            if (instance.isValid())
            {
                PLAYBACK_STATE playbackState;
                instance.getPlaybackState(out playbackState);
                return (playbackState != PLAYBACK_STATE.STOPPED);
            }

            return false;
        }
    }
}