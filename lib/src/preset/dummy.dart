import 'package:protobuf/protobuf.dart';

import '../../common_proto.dart';
import '../agent/preset_manager.dart';
import '../generated/call_builder.pb.dart';
import '../generated/preset_manager.pb.dart';
import '../preset_base.dart';
import '../xcrpc_client.dart';

import '../generated/note_domain.pb.dart';

import '../generated/note_co.pbgrpc.dart';
import '../generated/note_auto.pb.dart';
import '../generated/domain/note_defs.pbenum.dart';

import '../generated/fixture_objects.pb.dart';
import '../generated/pipelines.pb.dart';
import '../generated/merchant_on_chain.pb.dart';

import '../util.dart';





class DummyPresetKeys{
  final String regionId;
  BundleKey get regionKey => BundleKey(regionId: regionId);
  final String? plId;
  BundleKey? get plKey => plId!=null?BundleKey(regionId: regionId, id: plId):null;
  final String noteId;
  BundleKey get noteKey => BundleKey(regionId: regionId, id: noteId);
  final String memoId;
  BundleKey get memoKey => BundleKey(regionId: regionId, id: memoId);

  DummyPresetKeys({
    required this.noteId,
    required this.memoId,
    this.plId,
    this.regionId='default'});

  factory DummyPresetKeys.fromMap(Map<String, String> keysMap){
    return DummyPresetKeys(
        noteId: keysMap['noteId']!,
        memoId: keysMap['memoId']!,
        plId: keysMap['plId'],
        regionId: keysMap['regionId']??'default'
    );
  }

  factory DummyPresetKeys.fromMeta(CallBuilderContextProto meta){
    Map<String, BundleKey> keysMap = meta.keys;
    return DummyPresetKeys(
        noteId: keysMap['note']!.id,
        memoId: keysMap['memo']!.id,
        plId: meta.plId,
        regionId: meta.regionId
    );
  }

  Map<String, String> get keys => {
    'noteId': noteId,
    'memoId': memoId,
  };

  PresetManagerCreatePresetPlRequest asPlRequest(String tag, String owner){
    return PresetManagerCreatePresetPlRequest()
      ..regionId = regionId
      ..presetName = 'Dummy'
      ..owner = owner
      ..tag = tag
      ..keys = StringMap(values: keys);
  }

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
      {PresetManagerAgent? presetAgent})
      : super(presetAgent ?? XcClient().presetManagerAgent(),
            keys.plKey ?? BundleKey(regionId: 'default', id: slugId()));

  
  
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
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("noteAttachToWorkEffort", "NoteCo", note, el, c);
    return this;
  }

  Future<Empty> noteAttachToWorkEffortCall(
    String workEffId
  ) async {
    noteAttachToWorkEffort(workEffId);
    await dispatch();
    return Empty.getDefault();
  }

  
  DummyPreset noteRevokeContent(
  ) {
    
    var el = NoteCoCall()
      ..revokeContent = noteWithNoteCoHandle;    
       
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("noteRevokeContent", "NoteCo", note, el, c);
    return this;
  }

  Future<Empty> noteRevokeContentCall(
  ) async {
    noteRevokeContent();
    await dispatch();
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
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("noteSetContent", "NoteCo", note, el, c);
    return this;
  }

  Future<Empty> noteSetContentCall(
    String cnt
  ) async {
    noteSetContent(cnt);
    await dispatch();
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
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("noteAttachToParty", "NoteCo", note, el, c);
    return this;
  }

  Future<Empty> noteAttachToPartyCall(
    String partyId
  ) async {
    noteAttachToParty(partyId);
    await dispatch();
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
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("noteSetContentComp", "NoteCo", note, el, c);
    return this;
  }

  Future<Empty> noteSetContentCompCall(
    String cnt
  ) async {
    noteSetContentComp(cnt);
    await dispatch();
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
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("noteDoneSlot", "NoteCo", note, el, c);
    return this;
  }

  Future<Empty> noteDoneSlotCall(
    String slotName
  ) async {
    noteDoneSlot(slotName);
    await dispatch();
    return Empty.getDefault();
  }

          
  
  
  NoteCoHandle get memoWithNoteCoHandle {
    return NoteCoHandle()
      ..regionId = memo.regionId
      ..bundleId = memo.id;
  }     

  
  DummyPreset memoGetNoteProto(
  ) {
    
    var el = NoteCoCall()
      ..getNoteProto = memoWithNoteCoHandle;    
       
     
    final c = NoteDefs.DEFAULT_DOMAIN.value;
    pushCall("memoGetNoteProto", "NoteCo", memo, el, c);
    return this;
  }

  Future<NoteProto> memoGetNoteProtoCall(
  ) async {
    memoGetNoteProto();
    var result= await dispatch();
    return NoteProto.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset memoAttachToWorkEffort(
    String workEffId
  ) {
    
    var el = NoteCoCall()
      ..attachToWorkEffort = (NoteCoAttachToWorkEffortRequest()
        ..handle = memoWithNoteCoHandle
        ..workEffId = workEffId       
      );     
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("memoAttachToWorkEffort", "NoteCo", memo, el, c);
    return this;
  }

  Future<Empty> memoAttachToWorkEffortCall(
    String workEffId
  ) async {
    memoAttachToWorkEffort(workEffId);
    await dispatch();
    return Empty.getDefault();
  }

  
  DummyPreset memoRevokeContent(
  ) {
    
    var el = NoteCoCall()
      ..revokeContent = memoWithNoteCoHandle;    
       
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("memoRevokeContent", "NoteCo", memo, el, c);
    return this;
  }

  Future<Empty> memoRevokeContentCall(
  ) async {
    memoRevokeContent();
    await dispatch();
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
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("memoSetContent", "NoteCo", memo, el, c);
    return this;
  }

  Future<Empty> memoSetContentCall(
    String cnt
  ) async {
    memoSetContent(cnt);
    await dispatch();
    return Empty.getDefault();
  }

  
  DummyPreset memoSetContentComp(
    String cnt
  ) {
    
    var el = NoteCoCall()
      ..setContentComp = (NoteCoSetContentCompRequest()
        ..handle = memoWithNoteCoHandle
        ..cnt = cnt       
      );     
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("memoSetContentComp", "NoteCo", memo, el, c);
    return this;
  }

  Future<Empty> memoSetContentCompCall(
    String cnt
  ) async {
    memoSetContentComp(cnt);
    await dispatch();
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
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("memoGetSlotValue", "NoteCo", memo, el, c);
    return this;
  }

  Future<ValueData> memoGetSlotValueCall(
    String slotName
  ) async {
    memoGetSlotValue(slotName);
    var result= await dispatch();
    return ValueData.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset memoGetContent(
  ) {
    
    var el = NoteCoCall()
      ..getContent = memoWithNoteCoHandle;    
       
     
    final c = NoteDefs.CONTENT.value;
    pushCall("memoGetContent", "NoteCo", memo, el, c);
    return this;
  }

  Future<StringValue> memoGetContentCall(
  ) async {
    memoGetContent();
    var result= await dispatch();
    return StringValue.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset memoAttachToParty(
    String partyId
  ) {
    
    var el = NoteCoCall()
      ..attachToParty = (NoteCoAttachToPartyRequest()
        ..handle = memoWithNoteCoHandle
        ..partyId = partyId       
      );     
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("memoAttachToParty", "NoteCo", memo, el, c);
    return this;
  }

  Future<Empty> memoAttachToPartyCall(
    String partyId
  ) async {
    memoAttachToParty(partyId);
    await dispatch();
    return Empty.getDefault();
  }

  
  DummyPreset memoSize(
  ) {
    
    var el = NoteCoCall()
      ..size = memoWithNoteCoHandle;    
       
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("memoSize", "NoteCo", memo, el, c);
    return this;
  }

  Future<Int32Value> memoSizeCall(
  ) async {
    memoSize();
    var result= await dispatch();
    return Int32Value.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset memoDoneSlot(
    String slotName
  ) {
    
    var el = NoteCoCall()
      ..doneSlot = (NoteCoDoneSlotRequest()
        ..handle = memoWithNoteCoHandle
        ..slotName = slotName       
      );     
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("memoDoneSlot", "NoteCo", memo, el, c);
    return this;
  }

  Future<Empty> memoDoneSlotCall(
    String slotName
  ) async {
    memoDoneSlot(slotName);
    await dispatch();
    return Empty.getDefault();
  }

  
  DummyPreset memoHasSlotValue(
    String slotName
  ) {
    
    var el = NoteCoCall()
      ..hasSlotValue = (NoteCoHasSlotValueRequest()
        ..handle = memoWithNoteCoHandle
        ..slotName = slotName       
      );     
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("memoHasSlotValue", "NoteCo", memo, el, c);
    return this;
  }

  Future<BoolValue> memoHasSlotValueCall(
    String slotName
  ) async {
    memoHasSlotValue(slotName);
    var result= await dispatch();
    return BoolValue.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset memoGetDecimals(
  ) {
    
    var el = NoteCoCall()
      ..getDecimals = memoWithNoteCoHandle;    
       
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("memoGetDecimals", "NoteCo", memo, el, c);
    return this;
  }

  Future<DecimalMap> memoGetDecimalsCall(
  ) async {
    memoGetDecimals();
    var result= await dispatch();
    return DecimalMap.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset memoName(
  ) {
    
    var el = NoteCoCall()
      ..name = memoWithNoteCoHandle;    
       
     
    final c = NoteDefs.TITLE.value;
    pushCall("memoName", "NoteCo", memo, el, c);
    return this;
  }

  Future<StringValue> memoNameCall(
  ) async {
    memoName();
    var result= await dispatch();
    return StringValue.fromBuffer(result.values.last.slotData);
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
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("noteUpdateNote", "NoteAuto", note, el, c);
    return this;
  }

  Future<Empty> noteUpdateNoteCall(
    String content,
    String author
  ) async {
    noteUpdateNote(content, author);
    await dispatch();
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
     
    final c = NoteDefs.NON_DOMAIN_FIELD.value;
    pushCall("memoUpdateNote", "NoteAuto", memo, el, c);
    return this;
  }

  Future<Empty> memoUpdateNoteCall(
    String content,
    String author
  ) async {
    memoUpdateNote(content, author);
    await dispatch();
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
     
    final c = 0;
    pushCall("merchantCreateMarketplace", "MerchantOnChain", merchant, el, c);
    return this;
  }

  Future<StringValue> merchantCreateMarketplaceCall(
    FixedPoint totalSupply
  ) async {
    merchantCreateMarketplace(totalSupply);
    var result= await dispatch();
    return StringValue.fromBuffer(result.values.last.slotData);
  }

          
  
       

  
  DummyPreset fixturesSomeNotes(
    int total
  ) {
    
    var el= FixtureObjectsCall()
        ..someNotes=Int32Value(value: total);    

         
    final c = 0;
    pushCall("fixturesSomeNotes", "FixtureObjects", fixtures, el, c);
    return this;
  }

  Future<Strings> fixturesSomeNotesCall(
    int total
  ) async {
    fixturesSomeNotes(total);
    var result= await dispatch();
    return Strings.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset fixturesOneNote(
  ) {
    
    var el= FixtureObjectsCall()
        ..oneNote=Empty.getDefault();    

         
    final c = 0;
    pushCall("fixturesOneNote", "FixtureObjects", fixtures, el, c);
    return this;
  }

  Future<XcRefId> fixturesOneNoteCall(
  ) async {
    fixturesOneNote();
    var result= await dispatch();
    return XcRefId.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset fixturesEcho(
    StructData input
  ) {
    
    var el= FixtureObjectsCall()
        ..echo=input;    

         
    final c = 0;
    pushCall("fixturesEcho", "FixtureObjects", fixtures, el, c);
    return this;
  }

  Future<StructData> fixturesEchoCall(
    StructData input
  ) async {
    fixturesEcho(input);
    var result= await dispatch();
    return StructData.fromBuffer(result.values.last.slotData);
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
    

         
    final c = 0;
    pushCall("plsCreateArchivePl", "Pipelines", pls, el, c);
    return this;
  }

  Future<StructData> plsCreateArchivePlCall(
    String token,
    String assetName,
    String regionId,
    StructData bindArgs
  ) async {
    plsCreateArchivePl(token, assetName, regionId, bindArgs);
    var result= await dispatch();
    return StructData.fromBuffer(result.values.last.slotData);
  }

  
  DummyPreset plsIsDone(
    String plId
  ) {
    
    var el= PipelinesCall()
        ..isDone=StringValue(value: plId);    

         
    final c = 0;
    pushCall("plsIsDone", "Pipelines", pls, el, c);
    return this;
  }

  Future<BoolValue> plsIsDoneCall(
    String plId
  ) async {
    plsIsDone(plId);
    var result= await dispatch();
    return BoolValue.fromBuffer(result.values.last.slotData);
  }

          
          
}

