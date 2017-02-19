# GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),debug)
  RESCOMP = windres
  TARGETDIR = bin/Debug
  TARGET = $(TARGETDIR)/libgrpc_cb.so
  OBJDIR = obj/Debug/grpc_cb_shared
  DEFINES += -DGRPC_CB_DLL_EXPORT
  INCLUDES += -I../include -I../third_party/grpc/include -I../third_party/grpc/third_party/protobuf/src -I../src/cpp_cb
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -g -fPIC
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS) -std=c++11
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += -llibprotobufd -lgrpc -lgpr -lzlib -lssleay32 -llibeay32
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L../third_party/grpc/vsprojects/Debug -L../third_party/grpc/third_party/protobuf/cmake/Debug -L../third_party/grpc/vsprojects/packages/grpc.dependencies.zlib.1.2.8.10/build/native/lib/v140/Win32/Debug/static/cdecl -L../third_party/grpc/vsprojects/packages/grpc.dependencies.openssl.1.0.204.1/build/native/lib/v140/Win32/Debug/static -shared
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release)
  RESCOMP = windres
  TARGETDIR = bin/Release
  TARGET = $(TARGETDIR)/libgrpc_cb.so
  OBJDIR = obj/Release/grpc_cb_shared
  DEFINES += -DNDEBUG -DGRPC_CB_DLL_EXPORT
  INCLUDES += -I../include -I../third_party/grpc/include -I../third_party/grpc/third_party/protobuf/src -I../src/cpp_cb
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -O2 -fPIC
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS) -std=c++11
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += -llibprotobuf -lgrpc -lgpr -lzlib -lssleay32 -llibeay32
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L../third_party/grpc/vsprojects/Release -L../third_party/grpc/third_party/protobuf/cmake/Release -L../third_party/grpc/vsprojects/packages/grpc.dependencies.zlib.1.2.8.10/build/native/lib/v140/Win32/Release/static/cdecl -L../third_party/grpc/vsprojects/packages/grpc.dependencies.openssl.1.0.204.1/build/native/lib/v140/Win32/Release/static -s -shared
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/channel.o \
	$(OBJDIR)/client_async_reader_helper.o \
	$(OBJDIR)/client_async_reader_impl.o \
	$(OBJDIR)/client_async_reader_recv_status.o \
	$(OBJDIR)/client_async_reader_writer_impl.o \
	$(OBJDIR)/client_async_reader_writer_impl2.o \
	$(OBJDIR)/client_async_writer_helper.o \
	$(OBJDIR)/client_async_writer_impl.o \
	$(OBJDIR)/client_async_writer_impl2.o \
	$(OBJDIR)/client_call_cqtag.o \
	$(OBJDIR)/client_reader_init_cqtag.o \
	$(OBJDIR)/service_stub.o \
	$(OBJDIR)/call.o \
	$(OBJDIR)/call_op_data.o \
	$(OBJDIR)/call_operations.o \
	$(OBJDIR)/completion_queue.o \
	$(OBJDIR)/do_next_completion.o \
	$(OBJDIR)/proto_utils.o \
	$(OBJDIR)/status.o \
	$(OBJDIR)/string_ref.o \
	$(OBJDIR)/server.o \
	$(OBJDIR)/server_credentials.o \
	$(OBJDIR)/server_method_call_cqtag.o \
	$(OBJDIR)/server_replier_cqtag.o \
	$(OBJDIR)/server_writer_impl.o \
	$(OBJDIR)/server_writer_write_cqtag.o \
	$(OBJDIR)/service.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

$(TARGET): $(GCH) ${CUSTOMFILES} $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking grpc_cb_shared
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning grpc_cb_shared
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) $(PCH)
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/channel.o: ../src/cpp_cb/client/channel.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/client_async_reader_helper.o: ../src/cpp_cb/client/client_async_reader_helper.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/client_async_reader_impl.o: ../src/cpp_cb/client/client_async_reader_impl.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/client_async_reader_recv_status.o: ../src/cpp_cb/client/client_async_reader_recv_status.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/client_async_reader_writer_impl.o: ../src/cpp_cb/client/client_async_reader_writer_impl.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/client_async_reader_writer_impl2.o: ../src/cpp_cb/client/client_async_reader_writer_impl2.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/client_async_writer_helper.o: ../src/cpp_cb/client/client_async_writer_helper.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/client_async_writer_impl.o: ../src/cpp_cb/client/client_async_writer_impl.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/client_async_writer_impl2.o: ../src/cpp_cb/client/client_async_writer_impl2.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/client_call_cqtag.o: ../src/cpp_cb/client/client_call_cqtag.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/client_reader_init_cqtag.o: ../src/cpp_cb/client/client_reader_init_cqtag.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/service_stub.o: ../src/cpp_cb/client/service_stub.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/call.o: ../src/cpp_cb/common/call.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/call_op_data.o: ../src/cpp_cb/common/call_op_data.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/call_operations.o: ../src/cpp_cb/common/call_operations.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/completion_queue.o: ../src/cpp_cb/common/completion_queue.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/do_next_completion.o: ../src/cpp_cb/common/do_next_completion.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/proto_utils.o: ../src/cpp_cb/common/proto_utils.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/status.o: ../src/cpp_cb/common/status.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/string_ref.o: ../src/cpp_cb/common/string_ref.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/server.o: ../src/cpp_cb/server/server.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/server_credentials.o: ../src/cpp_cb/server/server_credentials.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/server_method_call_cqtag.o: ../src/cpp_cb/server/server_method_call_cqtag.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/server_replier_cqtag.o: ../src/cpp_cb/server/server_replier_cqtag.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/server_writer_impl.o: ../src/cpp_cb/server/server_writer_impl.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/server_writer_write_cqtag.o: ../src/cpp_cb/server/server_writer_write_cqtag.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/service.o: ../src/cpp_cb/server/service.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif