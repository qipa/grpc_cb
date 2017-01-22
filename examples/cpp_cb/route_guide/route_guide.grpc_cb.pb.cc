// Generated by the gRPC protobuf plugin.
// If you make any local change, they will be lost.
// source: route_guide.proto

#include "route_guide.grpc_cb.pb.h"

#include <google/protobuf/descriptor.h>
#include <google/protobuf/stubs/once.h>

#include <grpc_cb/impl/client/client_async_call_cqtag.h>  // for ClientAsyncCallCqTag
#include <grpc_cb/impl/client/client_call_cqtag.h>        // for ClientCallCqTag
#include <grpc_cb/impl/completion_queue.h>                // for CompletionQueue
#include <grpc_cb/impl/proto_utils.h>                     // for Proto::Deserialize()
#include <grpc_cb/impl/server/server_reader_cqtag.h>      // for ServerReaderCqTag
#include <grpc_cb/impl/server/server_reader_writer_cqtag.h>  // for ServerReaderWriterCqTag

// package routeguide
namespace routeguide {

namespace {

const ::google::protobuf::ServiceDescriptor*
service_descriptor_RouteGuide = nullptr;

void AssignDesc_route_5fguide_2eproto() {
  // Get the file's descriptor from the pool.
  const ::google::protobuf::FileDescriptor* file =
    ::google::protobuf::DescriptorPool::generated_pool()->FindFileByName(
      "route_guide.proto");
  GOOGLE_CHECK(file != NULL);
  service_descriptor_RouteGuide = file->service(0);
}  // AssignDesc_route_5fguide_2eproto()

GOOGLE_PROTOBUF_DECLARE_ONCE(grpc_cb_AssignDescriptors_once_);
inline void AssignDescriptorsOnce() {
  ::google::protobuf::GoogleOnceInit(
    &grpc_cb_AssignDescriptors_once_,
    &AssignDesc_route_5fguide_2eproto);
}

}  // namespace

namespace RouteGuide {  // service RouteGuide

static const std::string method_names[] = {
  "/routeguide.RouteGuide/GetFeature",
  "/routeguide.RouteGuide/ListFeatures",
  "/routeguide.RouteGuide/RecordRoute",
  "/routeguide.RouteGuide/RouteChat",
};

const ::google::protobuf::ServiceDescriptor& GetServiceDescriptor() {
  AssignDescriptorsOnce();
  assert(service_descriptor_RouteGuide);
  return *service_descriptor_RouteGuide;
}

Stub::Stub(const ::grpc_cb::ChannelSptr& channel)
    : ::grpc_cb::ServiceStub(channel) {}

::grpc_cb::Status Stub::BlockingGetFeature(
    const ::routeguide::Point& request,
    ::routeguide::Feature* response) {
  assert(response);
  ::grpc_cb::CompletionQueue cq;
  ::grpc_cb::CallSptr call_sptr(GetChannel().MakeSharedCall(method_names[0], cq));
  ::grpc_cb::ClientCallCqTag tag(call_sptr);
  if (!tag.Start(request))
    return ::grpc_cb::Status::InternalError("Failed to request.");
  cq.Pluck(&tag);
  return tag.GetResponse(*response);
}

void Stub::AsyncGetFeature(
    const ::routeguide::Point& request,
    const GetFeatureCallback& cb,
    const ::grpc_cb::ErrorCallback& ecb) {
  ::grpc_cb::CallSptr call_sptr(
      GetChannel().MakeSharedCall(method_names[0], GetCq()));
  using CqTag = ::grpc_cb::ClientAsyncCallCqTag<::routeguide::Feature>;
  CqTag* tag = new CqTag(call_sptr, cb, ecb);
  if (tag->Start(request)) return;
  delete tag;
  if (ecb)
    ecb(::grpc_cb::Status::InternalError("Failed to async request."));
}

::grpc_cb::ClientSyncReader<::routeguide::Feature>
Stub::SyncListFeatures(const ::routeguide::Rectangle& request) {
  return ::grpc_cb::ClientSyncReader<::routeguide::Feature>(
      GetChannelSptr(), method_names[1], request);
}

void Stub::AsyncListFeatures(
    const ::routeguide::Rectangle& request,
    const ListFeaturesMsgCb& on_msg,
    const ::grpc_cb::StatusCallback& on_status) {
  ::grpc_cb::ClientAsyncReader<::routeguide::Feature> reader(
      GetChannelSptr(), method_names[1], request, GetCqSptr());
  reader.ReadEach(on_msg, on_status);
}

::grpc_cb::ClientSyncWriter<::routeguide::Point>
Stub::SyncRecordRoute() {
  return ::grpc_cb::ClientSyncWriter<::routeguide::Point>(
      GetChannelSptr(), method_names[2]);
}

::grpc_cb::ClientAsyncWriter<
    ::routeguide::Point,
    ::routeguide::RouteSummary>
Stub::AsyncRecordRoute() {
  return ::grpc_cb::ClientAsyncWriter<
      ::routeguide::Point,
      ::routeguide::RouteSummary>(
          GetChannelSptr(), method_names[2], GetCqSptr());
}

::grpc_cb::ClientSyncReaderWriter<
    ::routeguide::RouteNote,
    ::routeguide::RouteNote>
Stub::SyncRouteChat() {
  return ::grpc_cb::ClientSyncReaderWriter<
      ::routeguide::RouteNote,
      ::routeguide::RouteNote>(
          GetChannelSptr(), method_names[3]);
}

::grpc_cb::ClientAsyncReaderWriter<
    ::routeguide::RouteNote,
    ::routeguide::RouteNote>
Stub::AsyncRouteChat(
    const ::grpc_cb::StatusCallback& on_status) {
  return ::grpc_cb::ClientAsyncReaderWriter<
      ::routeguide::RouteNote,
      ::routeguide::RouteNote>(
          GetChannelSptr(), method_names[3], GetCqSptr(), on_status);
}

Service::Service() {}

Service::~Service() {}

const std::string& Service::GetMethodName(size_t method_index) const {
  assert(method_index < GetMethodCount());
  return method_names[method_index];
}

void Service::CallMethod(
    size_t method_index, grpc_byte_buffer* request_buffer,
    const ::grpc_cb::CallSptr& call_sptr) {
  assert(method_index < GetMethodCount());
  switch (method_index) {
    case 0:
      assert(request_buffer);
      GetFeature(*request_buffer,
          GetFeature_Replier(call_sptr));
      return;
    case 1:
      assert(request_buffer);
      ListFeatures(*request_buffer,
          ListFeatures_Writer(call_sptr));
      return;
    case 2:
      assert(!request_buffer);
      RecordRoute(call_sptr);
      return;
    case 3:
      assert(!request_buffer);
      RouteChat(call_sptr);
      return;
  }  // switch
  assert(false);
  (void)request_buffer;
  (void)call_sptr;
}

void Service::GetFeature(
    grpc_byte_buffer& request_buffer,
    const GetFeature_Replier& replier) {
  using Request = ::routeguide::Point;
  Request request;
  ::grpc_cb::Status status =
      ::grpc_cb::Proto::Deserialize(
          &request_buffer, &request, 0 /* TODO: max_message_size*/);
  if (status.ok()) {
    GetFeature(request, replier);
    return;
  }
  GetFeature_Replier(
      replier).ReplyError(status);
}
void Service::GetFeature(
    const ::routeguide::Point& request,
    GetFeature_Replier replier) {
  (void)request;
  replier.ReplyError(::grpc_cb::Status::UNIMPLEMENTED);
}

void Service::ListFeatures(grpc_byte_buffer& request_buffer,
    const ListFeatures_Writer& writer) {
  using Request = ::routeguide::Rectangle;
  Request request;
  ::grpc_cb::Status status =
      ::grpc_cb::Proto::Deserialize(
          &request_buffer, &request, 0 /* TODO: max_message_size*/);
  if (status.ok()) {
    ListFeatures(request, writer);
    return;
  }
  writer.AsyncClose(status);
}

void Service::ListFeatures(
    const ::routeguide::Rectangle& request,
    ListFeatures_Writer writer) {
  (void)request;
  writer.AsyncClose(::grpc_cb::Status::UNIMPLEMENTED);
}

void Service::RecordRoute(const ::grpc_cb::CallSptr& call_sptr) {
  assert(call_sptr);
  RecordRoute_Replier replier(call_sptr);
  RecordRoute_ReaderSptr reader_sptr = RecordRoute(replier);
  if (!reader_sptr) return;
  reader_sptr->SetReplier(replier);

  using CqTag = ::grpc_cb::ServerReaderCqTag<
      ::routeguide::Point>;
  CqTag* tag = new CqTag(call_sptr, reader_sptr);
  if (tag->Start()) return;

  delete tag;
  reader_sptr->OnError(::grpc_cb::Status::InternalError(
      "Failed to init server reader."));
}

Service::RecordRoute_ReaderSptr
Service::RecordRoute(RecordRoute_Replier replier) {
  replier.ReplyError(::grpc_cb::Status::UNIMPLEMENTED);
  return nullptr;
}

void Service::RouteChat(const ::grpc_cb::CallSptr& call_sptr) {
  assert(call_sptr);
  RouteChat_Writer writer(call_sptr);
  RouteChat_ReaderSptr reader_sptr = RouteChat(writer);
  if (!reader_sptr) return;
  reader_sptr->SetWriter(writer);

  using RwCqTag = ::grpc_cb::ServerReaderWriterCqTag<
      ::routeguide::RouteNote>;
  RwCqTag* tag = new RwCqTag(call_sptr, reader_sptr);
  if (tag->Start()) return;

  delete tag;
  reader_sptr->OnError(::grpc_cb::Status::InternalError(
      "Failed to init server stream."));
}

Service::RouteChat_ReaderSptr
Service::RouteChat(RouteChat_Writer writer) {
  writer.AsyncClose(::grpc_cb::Status::UNIMPLEMENTED);
  return nullptr;
}

}  // namespace RouteGuide

}  // namespace routeguide

