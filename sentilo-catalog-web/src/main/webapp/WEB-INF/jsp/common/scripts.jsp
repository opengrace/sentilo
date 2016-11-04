<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<spring:message code="sure.delete" var="deleteConfirmMessage" />
<spring:message code="sure.unassign" var="unassignConfirmMessage" />
<spring:message code="select.one" var="selectOneErrorMessage" />
<spring:message code="ok" var="okButtonLabel" />

<script type="text/javascript">
function openDetail(url) {
	window.location.href = url;
};

function deleteSelected(formName, deleteConfirmMessage) {
	if(deleteConfirmMessage){
		confirmFormSubmission(formName, deleteConfirmMessage);
	}else{
		confirmFormSubmission(formName, '${deleteConfirmMessage}');
	}
};

function changeAccessType(formName, confirmMessage, newType, changeAccessTypeUrl){		
	var accessTypeHiddenField =  buildTextHiddenField("newAccessType",newType );
	var hiddenFields = [accessTypeHiddenField];
	confirmFormSubmission(formName, confirmMessage, changeAccessTypeUrl, hiddenFields);
}

function changeMapVisibility(formName, confirmMessage, newMapVisibility, changeMapVisibilityUrl){		
	var changeMapVisibilityHiddenField = buildTextHiddenField("newMapVisibility",newMapVisibility ); 
	var hiddenFields = [changeMapVisibilityHiddenField];
	confirmFormSubmission(formName, confirmMessage, changeMapVisibilityUrl, hiddenFields);
}

function changeSensorsState(formName, confirmMessage, changeStateUrl){		
	var newSensorsState = $("#sensorState").val();
	var newSensorsSubstate = $("#sensorSubstate").val();
	var sensorsStateHiddenField =  buildTextHiddenField("newState",newSensorsState );
	var sensorsSubstateHiddenField =  buildTextHiddenField("newSubstate",newSensorsSubstate ); 
	
	var hiddenFields = [sensorsStateHiddenField] ;	
	hiddenFields.push(sensorsSubstateHiddenField);
	
	
	confirmFormSubmission(formName, confirmMessage, changeStateUrl, hiddenFields);
}

function unassignSelected(formName) {
	confirmFormSubmission(formName, '${unassignConfirmMessage}');	
};

function confirmFormSubmission(formName, message, formActionUrl, childrenHiddenFields) {
	var n = $('input:checked').length;
	if (n > 0) {
		bootbox.confirm(message, function(result) {
			if(result == true) {
				if(childrenHiddenFields && childrenHiddenFields.length > 0){
					for (i = 0; i < childrenHiddenFields.length; i++) {
						$('form#' + formName).append(childrenHiddenFields[i]);
					} 										
				}
				
				if(formActionUrl){
					$('form#' + formName).attr('action',formActionUrl);
				}
				$('form#' + formName).submit();
			}
		});
	} else {
		bootbox.dialog('${selectOneErrorMessage}', [{
			'label' : '${okButtonLabel}',
			'class' : 'btn-danger'
		}]);
	}
};

function preventEnterSubmit(event) {
	return event.keyCode != 13;
};

function addTimestampToURL(url) {
	var ts = new Date().getTime();
	if (url.indexOf('?') !== -1) {
		return url + '&ts=' + ts;
	}
	return url + '?ts=' + ts;
}

function addParamToUrl(url, paramName, paramValue){
	var charToAdd = (url.indexOf('?') !== -1 ? '&' :'?');	
	return (paramValue && paramValue!='' ? url + charToAdd +paramName+'=' + paramValue : url);
}

function jsonGET(url, data, success) {
    $.ajax({
    	'contentType':'application/x-www-form-urlencoded; charset=UTF-8',
        'dataType' : 'json',
        'type' : 'GET',
        'url' : addTimestampToURL(url),
        'data' : data,
        'success' : success
    });
};

function buildTextHiddenField(fieldName, fieldValue){
	return '<input type="hidden" name="'+fieldName+'" value="'+fieldValue+'" />';	
}

function formatGraphTimestamp(timestamp) {
	return timestamp.replace('T', '<br/>');
};

function addLeadingZeroes(text) {
	return ('0' + text).slice(-2);
}  

function formatTimestamp(timestamp) {
	return timestamp.replace('T', ' ');
};

function isValidDecimalNumber(number) {
	 return (/^([0-9])*[.]?[0-9]*$/.test(number));
}

</script>

<spring:url value="/static/js/jquery-1.9.0.js" var="jqueryJS" />
<spring:url value="/static/js/bootstrap.min.js" var="bootstrapJS" />
<spring:url value="/static/js/jquery.dataTables.js" var="jqueryDataTablesJS" />
<spring:url value="/static/js/bootbox.min.js" var="bootboxJS" />
<spring:url value="/static/js/jquery.pnotify.min.js" var="jqueryPinesNotifyJS" />
<spring:url value="/static/js/jquery.tagsinput.js" var="jqueryTagsInputJS" />
<spring:url value="/static/js/bootstrap-colorpicker.min.js" var="bootstrapColorPickerJS" />

<script type="text/javascript" src="${jqueryJS}"></script>
<script type="text/javascript" src="${bootstrapJS}"></script>
<script type="text/javascript" src="${bootboxJS}"></script>
<script type="text/javascript" src="${jqueryDataTablesJS}"></script>
<script type="text/javascript" src="${jqueryPinesNotifyJS}"></script>
<script type="text/javascript" src="${jqueryTagsInputJS}"></script>
<script type="text/javascript" src="${bootstrapColorPickerJS}"></script>

<%@include file="/WEB-INF/jsp/common/customScripts.jsp"%>