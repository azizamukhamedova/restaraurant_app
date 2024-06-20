// import 'dart:io';

// import 'package:html_editor_enhanced/html_editor.dart';

// /// models
// import '/src/data/models/plai/plai_model.dart';
// import '/src/data/models/todo/task_detail_model.dart';
// import '/src/data/models/contact/business_card_model.dart';
// import '/src/data/models/company/company_detail_model.dart';
// import '/src/data/models/contact/contact_detail_model.dart';
// import '/src/data/models/company/company_lookup_model.dart';
// import '/src/data/models/appointment/appointment_detail_model.dart';
// import '/src/data/models/opportunity/opportunity_detail_model.dart';

// class AppIsNotCompatiblePageArguments {
//   final bool hasBackButton;

//   AppIsNotCompatiblePageArguments({
//     this.hasBackButton = false,
//   });
// }

// class HtmlEditorPageArguments {
//   final String initialText;
//   final HtmlEditorController controller;
//   final Function(String? changed) onChangeContent;
//   final Function updateUI;

//   HtmlEditorPageArguments({
//     required this.initialText,
//     required this.controller,
//     required this.onChangeContent,
//     required this.updateUI,
//   });
// }

// class TodoDetailPageArguments {
//   final String todoId;
//   final bool fromSearchPage;

//   TodoDetailPageArguments({
//     required this.todoId,
//     this.fromSearchPage = false,
//   });
// }

// class TodoEditPageArguments {
//   final TaskDetailModel taskModel;
//   final bool fromSearchPage;

//   TodoEditPageArguments({
//     required this.taskModel,
//     this.fromSearchPage = false,
//   });
// }

// class CreatePageArguments {
//   final int? companyId;
//   final String? companyName;
//   final int? contactId;
//   final String? contactName;
//   final int? entityTypeId;
//   final String? entityTypeName;
//   final int? entityItemId;
//   final String? entityGuid;
//   final String? entityTag;
//   final String? entityItemDisplayName;
//   final List<CompanyLookupModel>? accounts;
//   final DateTime? date;
//   final Function? runAfterCreation;

//   CreatePageArguments({
//     this.companyId,
//     this.companyName,
//     this.contactId,
//     this.contactName,
//     this.entityTypeId,
//     this.entityTypeName,
//     this.entityItemId,
//     this.entityGuid,
//     this.entityTag,
//     this.entityItemDisplayName,
//     this.accounts,
//     this.date,
//     this.runAfterCreation,
//   });
// }

// class OpportunityDetailPageArguments {
//   final int opportunityId;
//   final bool fromSearchPage;

//   OpportunityDetailPageArguments({
//     required this.opportunityId,
//     this.fromSearchPage = false,
//   });
// }

// class OpportunityEditPageArguments {
//   final OpportunityDetailModel opportunity;
//   final bool fromSearchPage;

//   OpportunityEditPageArguments({
//     required this.opportunity,
//     this.fromSearchPage = false,
//   });
// }

// class AppointmentDetailPageArguments {
//   final String appointmentId;
//   final Function(AppointmentDetailModel) updateAppointment;
//   final bool fromSearchPage;

//   AppointmentDetailPageArguments({
//     required this.appointmentId,
//     required this.updateAppointment,
//     this.fromSearchPage = false,
//   });
// }

// class AppointmentEditPageArguments {
//   final AppointmentDetailModel appointment;
//   final bool fromSearchPage;

//   AppointmentEditPageArguments({
//     required this.appointment,
//     this.fromSearchPage = false,
//   });
// }

// class AccountDetailPageArguments {
//   final int companyId;
//   final bool fromSearchPage;

//   AccountDetailPageArguments({
//     required this.companyId,
//     this.fromSearchPage = false,
//   });
// }

// class AccountEditPageArguments {
//   final CompanyDetailModel company;
//   final bool fromSearchPage;

//   AccountEditPageArguments({
//     required this.company,
//     this.fromSearchPage = false,
//   });
// }

// class ContactDetailPageArguments {
//   final int contactId;
//   final bool fromSearchPage;
//   final bool goToEditScreen;
//   final BusinessCardModel? scannedContact;
//   final Function(int contactId) removeContact;

//   ContactDetailPageArguments({
//     required this.contactId,
//     this.fromSearchPage = false,
//     this.goToEditScreen = false,
//     this.scannedContact,
//     required this.removeContact,
//   });
// }

// class ContactEditPageArguments {
//   final ContactDetailModel contact;
//   final bool fromSearchPage;

//   ContactEditPageArguments({
//     required this.contact,
//     this.fromSearchPage = false,
//   });
// }

// class AzureLoginPageArguments {
//   final String weburl;

//   AzureLoginPageArguments({
//     required this.weburl,
//   });
// }

// class WPLoginPageArguments {
//   WPLoginPageArguments();
// }

// class PlaimakerPageArguments {
//   final bool showOnboarding;
//   final bool fromAccountScreen;
//   final List<PlaiModel> plais;

//   PlaimakerPageArguments({
//     this.showOnboarding = false,
//     this.fromAccountScreen = false,
//     this.plais = const [],
//   });
// }

// class SendEmailPageArguments {
//   final bool sendAsSingleEmail;

//   SendEmailPageArguments({
//     required this.sendAsSingleEmail,
//   });
// }

// class WebViewPageArguments {
//   final bool addCookies;
//   final String webViewUrl;
//   final String pageName;

//   WebViewPageArguments({
//     this.addCookies = false,
//     required this.webViewUrl,
//     this.pageName = 'web_view_page',
//   });
// }

// class PlaimakerUpdatingPageArguments {
//   final String text;

//   PlaimakerUpdatingPageArguments({
//     required this.text,
//   });
// }

// class ScanCardPageArguments {
//   final Function(String file) select;

//   ScanCardPageArguments({
//     required this.select,
//   });
// }

// class CropImagePageArguments {
//   final File image;
//   final Function(String file) select;

//   CropImagePageArguments({
//     required this.image,
//     required this.select,
//   });
// }
