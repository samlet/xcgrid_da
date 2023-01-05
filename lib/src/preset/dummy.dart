import 'package:protobuf/protobuf.dart';

import '../../common_proto.dart';
import '../agent/preset_manager.dart';
import '../generated/call_builder.pb.dart';
import '../preset_base.dart';
import '../xcrpc_client.dart';

import '../generated/note_co.pbgrpc.dart';
import '../generated/note_auto.pb.dart';

import '../generated/fixture_objects.pb.dart';
import '../generated/pipelines.pb.dart';
import '../generated/merchant_on_chain.pb.dart';

import '../util.dart';





class DummyPresetKeys{
  final String regionId;
  BundleKey get regionKey => BundleKey(regionId: regionId);
  final String noteId;
  BundleKey get noteKey => BundleKey(regionId: regionId, id: noteId);
  final String memoId;
  BundleKey get memoKey => BundleKey(regionId: regionId, id: memoId);

  DummyPresetKeys({
    required this.noteId,
    required this.memoId,
    this.regionId='default'});

}

class DummyPreset extends PresetBase {
  final DummyPresetKeys keys;
  BundleKey get note => keys.noteKey;
  BundleKey get memo => keys.memoKey;
  BundleKey get merchant => keys.regionKey;
  BundleKey get fixtures => keys.regionKey;
  BundleKey get pls => keys.regionKey;       

  DummyPreset(
      this.keys,
      {BundleKey? plKey, PresetManagerAgent? presetAgent})
      : super(presetAgent ?? XcClient().presetManagerAgent(),
            plKey ?? BundleKey(regionId: 'default', id: slugId()));

  
  
  NoteCoHandle get noteWithNoteCoHandle {
    return NoteCoHandle()
      ..regionId = note.regionId
      ..bundleId = note.id;
  }     

  
  DummyPreset noteAttachToWorkEffort(
    String workEffId
  ) {
    
    var el = NoteCoCall()
      ..attachToWorkEffort = (NoteCoAttachToWorkEffortRequest()
        ..handle = noteWithNoteCoHandle
        ..workEffId = workEffId       
      );     
     
    pushCall("noteAttachToWorkEffort", "NoteCo", note, el);
    return this;
  }

  Future<Empty> noteAttachToWorkEffortCall(
    String workEffId
  ) async {
    noteAttachToWorkEffort(workEffId);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

  
  DummyPreset noteRevokeContent(
  ) {
    
    var el = NoteCoCall()
      ..revokeContent = noteWithNoteCoHandle;    
       
     
    pushCall("noteRevokeContent", "NoteCo", note, el);
    return this;
  }

  Future<Empty> noteRevokeContentCall(
  ) async {
    noteRevokeContent();
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

  
  DummyPreset noteSetContent(
    String cnt
  ) {
    
    var el = NoteCoCall()
      ..setContent = (NoteCoSetContentRequest()
        ..handle = noteWithNoteCoHandle
        ..cnt = cnt       
      );     
     
    pushCall("noteSetContent", "NoteCo", note, el);
    return this;
  }

  Future<Empty> noteSetContentCall(
    String cnt
  ) async {
    noteSetContent(cnt);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

  
  DummyPreset noteAttachToParty(
    String partyId
  ) {
    
    var el = NoteCoCall()
      ..attachToParty = (NoteCoAttachToPartyRequest()
        ..handle = noteWithNoteCoHandle
        ..partyId = partyId       
      );     
     
    pushCall("noteAttachToParty", "NoteCo", note, el);
    return this;
  }

  Future<Empty> noteAttachToPartyCall(
    String partyId
  ) async {
    noteAttachToParty(partyId);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

  
  DummyPreset noteSetContentComp(
    String cnt
  ) {
    
    var el = NoteCoCall()
      ..setContentComp = (NoteCoSetContentCompRequest()
        ..handle = noteWithNoteCoHandle
        ..cnt = cnt       
      );     
     
    pushCall("noteSetContentComp", "NoteCo", note, el);
    return this;
  }

  Future<Empty> noteSetContentCompCall(
    String cnt
  ) async {
    noteSetContentComp(cnt);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

  
  DummyPreset noteDoneSlot(
    String slotName
  ) {
    
    var el = NoteCoCall()
      ..doneSlot = (NoteCoDoneSlotRequest()
        ..handle = noteWithNoteCoHandle
        ..slotName = slotName       
      );     
     
    pushCall("noteDoneSlot", "NoteCo", note, el);
    return this;
  }

  Future<Empty> noteDoneSlotCall(
    String slotName
  ) async {
    noteDoneSlot(slotName);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

          
  
  
  NoteCoHandle get memoWithNoteCoHandle {
    return NoteCoHandle()
      ..regionId = memo.regionId
      ..bundleId = memo.id;
  }     

  
  DummyPreset memoAttachToWorkEffort(
    String workEffId
  ) {
    
    var el = NoteCoCall()
      ..attachToWorkEffort = (NoteCoAttachToWorkEffortRequest()
        ..handle = memoWithNoteCoHandle
        ..workEffId = workEffId       
      );     
     
    pushCall("memoAttachToWorkEffort", "NoteCo", memo, el);
    return this;
  }

  Future<Empty> memoAttachToWorkEffortCall(
    String workEffId
  ) async {
    memoAttachToWorkEffort(workEffId);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

  
  DummyPreset memoRevokeContent(
  ) {
    
    var el = NoteCoCall()
      ..revokeContent = memoWithNoteCoHandle;    
       
     
    pushCall("memoRevokeContent", "NoteCo", memo, el);
    return this;
  }

  Future<Empty> memoRevokeContentCall(
  ) async {
    memoRevokeContent();
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

  
  DummyPreset memoSetContent(
    String cnt
  ) {
    
    var el = NoteCoCall()
      ..setContent = (NoteCoSetContentRequest()
        ..handle = memoWithNoteCoHandle
        ..cnt = cnt       
      );     
     
    pushCall("memoSetContent", "NoteCo", memo, el);
    return this;
  }

  Future<Empty> memoSetContentCall(
    String cnt
  ) async {
    memoSetContent(cnt);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

  
  DummyPreset memoAttachToParty(
    String partyId
  ) {
    
    var el = NoteCoCall()
      ..attachToParty = (NoteCoAttachToPartyRequest()
        ..handle = memoWithNoteCoHandle
        ..partyId = partyId       
      );     
     
    pushCall("memoAttachToParty", "NoteCo", memo, el);
    return this;
  }

  Future<Empty> memoAttachToPartyCall(
    String partyId
  ) async {
    memoAttachToParty(partyId);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

  
  DummyPreset memoSize(
  ) {
    
    var el = NoteCoCall()
      ..size = memoWithNoteCoHandle;    
       
     
    pushCall("memoSize", "NoteCo", memo, el);
    return this;
  }

  Future<Int32Value> memoSizeCall(
  ) async {
    memoSize();
    var result= await presetAgent.dispatch(plKey.id, toProto());
    return Int32Value.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset memoSetContentComp(
    String cnt
  ) {
    
    var el = NoteCoCall()
      ..setContentComp = (NoteCoSetContentCompRequest()
        ..handle = memoWithNoteCoHandle
        ..cnt = cnt       
      );     
     
    pushCall("memoSetContentComp", "NoteCo", memo, el);
    return this;
  }

  Future<Empty> memoSetContentCompCall(
    String cnt
  ) async {
    memoSetContentComp(cnt);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

  
  DummyPreset memoDoneSlot(
    String slotName
  ) {
    
    var el = NoteCoCall()
      ..doneSlot = (NoteCoDoneSlotRequest()
        ..handle = memoWithNoteCoHandle
        ..slotName = slotName       
      );     
     
    pushCall("memoDoneSlot", "NoteCo", memo, el);
    return this;
  }

  Future<Empty> memoDoneSlotCall(
    String slotName
  ) async {
    memoDoneSlot(slotName);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

  
  DummyPreset memoGetSlotValue(
    String slotName
  ) {
    
    var el = NoteCoCall()
      ..getSlotValue = (NoteCoGetSlotValueRequest()
        ..handle = memoWithNoteCoHandle
        ..slotName = slotName       
      );     
     
    pushCall("memoGetSlotValue", "NoteCo", memo, el);
    return this;
  }

  Future<ValueData> memoGetSlotValueCall(
    String slotName
  ) async {
    memoGetSlotValue(slotName);
    var result= await presetAgent.dispatch(plKey.id, toProto());
    return ValueData.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset memoHasSlotValue(
    String slotName
  ) {
    
    var el = NoteCoCall()
      ..hasSlotValue = (NoteCoHasSlotValueRequest()
        ..handle = memoWithNoteCoHandle
        ..slotName = slotName       
      );     
     
    pushCall("memoHasSlotValue", "NoteCo", memo, el);
    return this;
  }

  Future<BoolValue> memoHasSlotValueCall(
    String slotName
  ) async {
    memoHasSlotValue(slotName);
    var result= await presetAgent.dispatch(plKey.id, toProto());
    return BoolValue.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset memoGetContent(
  ) {
    
    var el = NoteCoCall()
      ..getContent = memoWithNoteCoHandle;    
       
     
    pushCall("memoGetContent", "NoteCo", memo, el);
    return this;
  }

  Future<StringValue> memoGetContentCall(
  ) async {
    memoGetContent();
    var result= await presetAgent.dispatch(plKey.id, toProto());
    return StringValue.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset memoGetDecimals(
  ) {
    
    var el = NoteCoCall()
      ..getDecimals = memoWithNoteCoHandle;    
       
     
    pushCall("memoGetDecimals", "NoteCo", memo, el);
    return this;
  }

  Future<DecimalMap> memoGetDecimalsCall(
  ) async {
    memoGetDecimals();
    var result= await presetAgent.dispatch(plKey.id, toProto());
    return DecimalMap.fromBuffer(result.values.last.slotData);
  }

          
  
  
  NoteAutoHandle get noteWithNoteAutoHandle {
    return NoteAutoHandle()
      ..regionId = note.regionId
      ..bundleId = note.id;
  }     

  
  DummyPreset noteUpdateNote(
    String content,
    String author
  ) {
    
    var el = NoteAutoCall()
      ..updateNote = (NoteAutoUpdateNoteRequest()
        ..handle = noteWithNoteAutoHandle
        ..content = content
        ..author = author       
      );     
     
    pushCall("noteUpdateNote", "NoteAuto", note, el);
    return this;
  }

  Future<Empty> noteUpdateNoteCall(
    String content,
    String author
  ) async {
    noteUpdateNote(content, author);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

          
  
  
  NoteAutoHandle get memoWithNoteAutoHandle {
    return NoteAutoHandle()
      ..regionId = memo.regionId
      ..bundleId = memo.id;
  }     

  
  DummyPreset memoUpdateNote(
    String content,
    String author
  ) {
    
    var el = NoteAutoCall()
      ..updateNote = (NoteAutoUpdateNoteRequest()
        ..handle = memoWithNoteAutoHandle
        ..content = content
        ..author = author       
      );     
     
    pushCall("memoUpdateNote", "NoteAuto", memo, el);
    return this;
  }

  Future<Empty> memoUpdateNoteCall(
    String content,
    String author
  ) async {
    memoUpdateNote(content, author);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }

          
  
  
  ChainHandle get merchantWithMerchantOnChainHandle {
    return ChainHandle()
      ..regionId = merchant.regionId;
  }     

  
  DummyPreset merchantCreateMarketplace(
    FixedPoint totalSupply
  ) {
    
    var el = MerchantOnChainCall()
      ..createMarketplace = (MerchantOnChainCreateMarketplaceRequest()
        ..handle = merchantWithMerchantOnChainHandle
        ..totalSupply = totalSupply       
      );     
     
    pushCall("merchantCreateMarketplace", "MerchantOnChain", merchant, el);
    return this;
  }

  Future<StringValue> merchantCreateMarketplaceCall(
    FixedPoint totalSupply
  ) async {
    merchantCreateMarketplace(totalSupply);
    var result= await presetAgent.dispatch(plKey.id, toProto());
    return StringValue.fromBuffer(result.values.last.slotData);
  }

          
  
       

  
  DummyPreset fixturesEcho(
    StructData input
  ) {
    
    var el= FixtureObjectsCall()
        ..echo=input;    

         
    pushCall("fixturesEcho", "FixtureObjects", fixtures, el);
    return this;
  }

  Future<StructData> fixturesEchoCall(
    StructData input
  ) async {
    fixturesEcho(input);
    var result= await presetAgent.dispatch(plKey.id, toProto());
    return StructData.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset fixturesOneNote(
  ) {
    
    var el= FixtureObjectsCall()
        ..oneNote=Empty.getDefault();    

         
    pushCall("fixturesOneNote", "FixtureObjects", fixtures, el);
    return this;
  }

  Future<XcRefId> fixturesOneNoteCall(
  ) async {
    fixturesOneNote();
    var result= await presetAgent.dispatch(plKey.id, toProto());
    return XcRefId.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset fixturesSomeNotes(
    int total
  ) {
    
    var el= FixtureObjectsCall()
        ..someNotes=Int32Value(value: total);    

         
    pushCall("fixturesSomeNotes", "FixtureObjects", fixtures, el);
    return this;
  }

  Future<Strings> fixturesSomeNotesCall(
    int total
  ) async {
    fixturesSomeNotes(total);
    var result= await presetAgent.dispatch(plKey.id, toProto());
    return Strings.fromBuffer(result.values.last.slotData);
  }

          
  
       

  
  DummyPreset plsIsDone(
    String plId
  ) {
    
    var el= PipelinesCall()
        ..isDone=StringValue(value: plId);    

         
    pushCall("plsIsDone", "Pipelines", pls, el);
    return this;
  }

  Future<BoolValue> plsIsDoneCall(
    String plId
  ) async {
    plsIsDone(plId);
    var result= await presetAgent.dispatch(plKey.id, toProto());
    return BoolValue.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset plsCreateArchivePl(
    String token,
    String assetName,
    String regionId,
    StructData bindArgs
  ) {
    
    
    var el = PipelinesCall()
      ..createArchivePl = (PipelinesCreateArchivePlRequest()
        ..token = token
        ..assetName = assetName
        ..regionId = regionId
        ..bindArgs = bindArgs       
      );     
    

         
    pushCall("plsCreateArchivePl", "Pipelines", pls, el);
    return this;
  }

  Future<StructData> plsCreateArchivePlCall(
    String token,
    String assetName,
    String regionId,
    StructData bindArgs
  ) async {
    plsCreateArchivePl(token, assetName, regionId, bindArgs);
    var result= await presetAgent.dispatch(plKey.id, toProto());
    return StructData.fromBuffer(result.values.last.slotData);
  }

          
          
}

