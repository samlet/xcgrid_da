/// gentool: DartCoAgentGenTool, co_agent.j2
import '../../common_proto.dart';
import '../generated/google/protobuf/duration.pb.dart';
import '../xcrpc_client.dart';
import '../generated/note_co_handle.pb.dart';
import '../generated/note_co.pbgrpc.dart';

import '../generated/note.pb.dart';

extension NoteCoSet on XcClient {
  NoteCoServiceClient noteCo(){
    return NoteCoServiceClient(channel);
  }

  
  NoteCoAgent noteCoAgent(String bundleId, {String? regionId}){
    var handle = NoteCoHandle()
      ..regionId = regionId??'default'
      ..bundleId = bundleId;
    return NoteCoAgent(noteCo(), handle);
  }

  NoteCoAgent noteCoAgentOf(XcRefId refId){
    return noteCoAgent(refId.bundleId, regionId: refId.regionId);
  }
  
}

/// NoteCo
class NoteCoAgent {
  final NoteCoServiceClient client;
  final NoteCoHandle handle;

  NoteCoAgent(this.client, this.handle);


  /// query::name -> String
  Future<StringValue> name() async {
    return (await client.name(handle));
  }    
       

  /// query::size -> Integer
  Future<Int32Value> size() async {
    return (await client.size(handle));
  }    
       

  /// query::getContent -> String
  Future<StringValue> getContent() async {
    return (await client.getContent(handle));
  }    
       

  /// attachToParty -> void
  Future<Empty> attachToParty(
    String partyId
  ) async {
    return (await client.attachToParty(NoteCoAttachToPartyRequest()
      ..handle = handle
      ..partyId = partyId
    ));
  }
     

  /// attachToWorkEffort -> void
  Future<Empty> attachToWorkEffort(
    String workEffId
  ) async {
    return (await client.attachToWorkEffort(NoteCoAttachToWorkEffortRequest()
      ..handle = handle
      ..workEffId = workEffId
    ));
  }
     

  /// setContentComp -> void
  Future<Empty> setContentComp(
    String cnt
  ) async {
    return (await client.setContentComp(NoteCoSetContentCompRequest()
      ..handle = handle
      ..cnt = cnt
    ));
  }
     

  /// revokeContent -> void
  Future<Empty> revokeContent() async {
    return (await client.revokeContent(handle));
  }    
       

  /// query::getNoteProto -> NoteProto
  Future<NoteProto> getNoteProto() async {
    return (await client.getNoteProto(handle));
  }    
       

  /// setContent -> void
  Future<Empty> setContent(
    String cnt
  ) async {
    return (await client.setContent(NoteCoSetContentRequest()
      ..handle = handle
      ..cnt = cnt
    ));
  }
     

  /// query::getDecimals -> DecimalMap
  Future<DecimalMap> getDecimals() async {
    return (await client.getDecimals(handle));
  }    
       

  /// doneSlot -> void
  Future<Empty> doneSlot(
    String slotName
  ) async {
    return (await client.doneSlot(NoteCoDoneSlotRequest()
      ..handle = handle
      ..slotName = slotName
    ));
  }
     

  /// query::hasSlotValue -> boolean
  Future<BoolValue> hasSlotValue(
    String slotName
  ) async {
    return (await client.hasSlotValue(NoteCoHasSlotValueRequest()
      ..handle = handle
      ..slotName = slotName
    ));
  }
     

  /// query::getSlotValue -> IonValue
  Future<ValueData> getSlotValue(
    String slotName
  ) async {
    return (await client.getSlotValue(NoteCoGetSlotValueRequest()
      ..handle = handle
      ..slotName = slotName
    ));
  }
     
        

}



 