import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/task_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'complete_tasks_model.dart';
export 'complete_tasks_model.dart';

class CompleteTasksWidget extends StatefulWidget {
  const CompleteTasksWidget({super.key});

  @override
  State<CompleteTasksWidget> createState() => _CompleteTasksWidgetState();
}

class _CompleteTasksWidgetState extends State<CompleteTasksWidget> {
  late CompleteTasksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompleteTasksModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0x00FFFFFF),
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'todo.ist',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Completed Tasks',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Container(
                        height: 18.0,
                        decoration: BoxDecoration(
                          color: const Color(0x00FFFFFF),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: StreamBuilder<List<TasksRecord>>(
                          stream: queryTasksRecord(
                            queryBuilder: (tasksRecord) => tasksRecord
                                .where(
                                  'user',
                                  isEqualTo: currentUserReference,
                                )
                                .where(
                                  'completed',
                                  isEqualTo: true,
                                ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<TasksRecord> listViewTasksRecordList =
                                snapshot.data!;
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewTasksRecordList.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 12.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewTasksRecord =
                                    listViewTasksRecordList[listViewIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'details',
                                      queryParameters: {
                                        'taskDoc': serializeParam(
                                          listViewTasksRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'taskDoc': listViewTasksRecord,
                                      },
                                    );
                                  },
                                  child: TaskComponentWidget(
                                    key: Key(
                                        'Keym3s_${listViewIndex}_of_${listViewTasksRecordList.length}'),
                                    tasks: listViewTasksRecord,
                                    checkbox: () async {
                                      await listViewTasksRecord.reference
                                          .update(createTasksRecordData(
                                        completed: false,
                                      ));
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
