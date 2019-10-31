<%--
 ~ Password Management Servlets (PWM)
 ~ http://www.pwm-project.org
 ~
 ~ Copyright (c) 2006-2009 Novell, Inc.
 ~ Copyright (c) 2009-2019 The PWM Project
 ~
 ~ Licensed under the Apache License, Version 2.0 (the "License");
 ~ you may not use this file except in compliance with the License.
 ~ You may obtain a copy of the License at
 ~
 ~     http://www.apache.org/licenses/LICENSE-2.0
 ~
 ~ Unless required by applicable law or agreed to in writing, software
 ~ distributed under the License is distributed on an "AS IS" BASIS,
 ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 ~ See the License for the specific language governing permissions and
 ~ limitations under the License.
--%>


<%@ page import="password.pwm.config.value.data.ShortcutItem" %>
<%@ page import="password.pwm.error.PwmException" %>
<%@ page import="password.pwm.http.JspUtility" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="password.pwm.http.servlet.ShortcutServlet" %>
<%@ page import="password.pwm.util.java.StringUtil" %>
<%@ page import="password.pwm.http.PwmRequestAttribute" %>
<!DOCTYPE html>

<%@ page language="java" session="true" isThreadSafe="true"
         contentType="text/html" %>
<%@ taglib uri="pwm" prefix="pwm" %>
<html lang="<pwm:value name="<%=PwmValue.localeCode%>"/>" dir="<pwm:value name="<%=PwmValue.localeDir%>"/>">
<%@ include file="fragment/header.jsp" %>
<body class="nihilo">
<%
    final boolean newWindow = JspUtility.getPwmRequest(pageContext).getConfig().readSettingAsBoolean(PwmSetting.SHORTCUT_NEW_WINDOW);
    final List<ShortcutItem> shortcutItems = (List<ShortcutItem>)JspUtility.getAttribute(pageContext, PwmRequestAttribute.ShortcutItems);
%>
<div id="wrapper">
    <jsp:include page="fragment/header-body.jsp">
        <jsp:param name="pwm.PageName" value="Title_Shortcuts"/>
    </jsp:include>
    <div id="centerbody">
        <table class="noborder">
            <h1 id="page-content-title"><pwm:display key="Title_Shortcuts" displayIfMissing="true"/></h1>
            <% if (shortcutItems.isEmpty()) { %>
            <p>No shortcuts</p>
            <% } else { %>
            <% for (final ShortcutItem item : shortcutItems) { %>
            <tr>
                <td class="menubutton_key">
                    <a id="button_ChangePassword" class="menubutton" href="<pwm:current-url/>?processAction=<%=ShortcutServlet.ShortcutAction.selectShortcut%>&link=<%=StringUtil.escapeHtml(item.getLabel())%>&pwmFormID=<pwm:FormID/>" id="form-shortcuts-<%=StringUtil.escapeHtml(item.getLabel())%>" <%=newWindow ? " target=\"_blank\"" : ""%>>
                        <%=item.getLabel()%>
                    </a>
                </td>
                <td>
                    <p><%=item.getDescription()%></p>
                </td>
            </tr>
            <% } %>
            <% } %>
        </table>
    </div>
    <div class="push"></div>
</div>
<%@ include file="fragment/footer.jsp" %>
</body>
</html>

