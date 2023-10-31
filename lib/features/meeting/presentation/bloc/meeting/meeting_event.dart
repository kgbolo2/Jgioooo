part of 'meeting_bloc.dart';

sealed class MeetingEvent extends Equatable {
  const MeetingEvent();

  @override
  List<Object> get props => [];
}

class PrepareMediaStreamEvent extends MeetingEvent {}

class CreateMeetingEvent extends MeetingEvent {
  final String roomName;
  final String password;
  const CreateMeetingEvent({required this.roomName, required this.password});
}

class UpdateMeetingEvent extends MeetingEvent {
  final String roomName;
  final String password;
  const UpdateMeetingEvent({required this.roomName, required this.password});
}

class JoinMeetingEvent extends MeetingEvent {
  final Meeting meeting;
  const JoinMeetingEvent({required this.meeting});
}

class JoinMeetingWithPasswordEvent extends MeetingEvent {
  final String password;
  final bool isHost;
  const JoinMeetingWithPasswordEvent({
    required this.password,
    this.isHost = false,
  });
}

class GetInfoMeetingEvent extends MeetingEvent {
  final int roomCode;
  const GetInfoMeetingEvent({required this.roomCode});
}

class LeaveMeetingEvent extends MeetingEvent {}

class DisposeMeetingEvent extends MeetingEvent {}

class DisplayDialogMeetingEvent extends MeetingEvent {
  final Meeting meeting;
  const DisplayDialogMeetingEvent({required this.meeting});
}

class NewParticipantEvent extends MeetingEvent {
  final String participantId;
  const NewParticipantEvent({required this.participantId});
}

class ParticipantHasLeftEvent extends MeetingEvent {
  final String participantId;
  const ParticipantHasLeftEvent({required this.participantId});
}

class ToggleAudioEvent extends MeetingEvent {}

class ToggleVideoEvent extends MeetingEvent {}

class SaveCallSettingsEvent extends MeetingEvent {
  final CallSetting setting;
  const SaveCallSettingsEvent({required this.setting});
}

class RefreshDisplayMeetingEvent extends MeetingEvent {}
