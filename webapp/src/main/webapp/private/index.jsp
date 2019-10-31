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


<%@ page import="password.pwm.http.JspUtility" %>
<%@ page import="password.pwm.http.servlet.PwmServletDefinition" %>
<%@ page import="password.pwm.http.tag.conditional.PwmIfTag" %>
<%@ page import="password.pwm.http.tag.conditional.PwmIfTest" %>
<%@ page import="password.pwm.*" %>

<!DOCTYPE html>
<%@ page language="java" session="true" isThreadSafe="true" contentType="text/html" %>
<%@ taglib uri="pwm" prefix="pwm" %>
<html lang="<pwm:value name="<%=PwmValue.localeCode%>"/>" dir="<pwm:value name="<%=PwmValue.localeDir%>"/>">
<%@ include file="../WEB-INF/jsp/fragment/header.jsp" %>
<body class="nihilo">
<div id="wrapper">
    <jsp:include page="../WEB-INF/jsp/fragment/header-body.jsp">
        <jsp:param name="pwm.PageName" value="Title_MainPage"/>
    </jsp:include>

    <div id="centerbody">
        <table class="noborder">
        <pwm:if test="<%=PwmIfTest.endUserFunctionalityAvailable%>" negate="true">
            <p><pwm:display key="Warning_NoEndUserModules" bundle="Config"/></p>
            <br/>
        </pwm:if>
        <pwm:if test="<%=PwmIfTest.endUserFunctionalityAvailable%>">
            <pwm:if test="<%=PwmIfTest.permission%>" permission="<%=Permission.CHANGE_PASSWORD%>">
                <tr>
                    <td class="menubutton_key">
                        <a id="button_ChangePassword" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.PrivateChangePassword.servletUrl()%>'/>">
                            <pwm:display key="Title_ChangePassword"/>
                        </a>
                    </td>
                    <td>
                        <p><pwm:display key="Long_Title_ChangePassword"/></p>
                    </td>
                </tr>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.peopleSearchEnabled%>">
                <pwm:if test="<%=PwmIfTest.permission%>" permission="<%=Permission.PEOPLE_SEARCH%>">
                    <tr>
                        <td class="menubutton_key">
                            <a id="button_PeopleSearch" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.PrivatePeopleSearch.servletUrl()%>'/>#/search">
                                <pwm:display key="Title_PeopleSearch"/>
                            </a>
                        </td>
                        <td>
                            <p><pwm:display key="Long_Title_PeopleSearch"/></p>
                        </td>
                    </tr>
                </pwm:if>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.orgChartEnabled%>">
                <pwm:if test="<%=PwmIfTest.permission%>" permission="<%=Permission.PEOPLE_SEARCH%>">
                    <tr>
                        <td class="menubutton_key">
                            <a id="button_PeopleSearch" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.PrivatePeopleSearch.servletUrl()%>'/>#/orgchart">
                                <pwm:display key="Title_OrgChart"/>
                            </a>
                        </td>
                        <td>
                            <p><pwm:display key="Title_OrgChart"/></p>
                        </td>
                    </tr>
                </pwm:if>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.setupChallengeEnabled%>">
                <pwm:if test="<%=PwmIfTest.permission%>" permission="<%=Permission.SETUP_RESPONSE%>">
                    <tr>
                        <td class="menubutton_key">
                            <a id="button_SetupResponses" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.SetupResponses.servletUrl()%>'/>">
                                <pwm:display key="Title_SetupResponses"/>
                            </a>
                        </td>
                        <td>
                            <p><pwm:display key="Long_Title_SetupResponses"/></p>
                        </td>
                    </tr>
                </pwm:if>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.otpSetupEnabled%>">
                <tr>
                    <td class="menubutton_key">
                        <a id="button_SetupOtpSecret" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.SetupOtp.servletUrl()%>'/>">
                            <pwm:display key="Title_SetupOtpSecret"/>
                        </a>
                    </td>
                    <td>
                        <p><pwm:display key="Long_Title_SetupOtpSecret"/></p>
                    </td>
                </tr>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.updateProfileAvailable%>">
                <tr>
                    <td class="menubutton_key">
                        <a id="button_UpdateProfile" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.UpdateProfile.servletUrl()%>'/>">
                            <pwm:display key="Title_UpdateProfile"/>
                        </a>
                    </td>
                    <td>
                        <p><pwm:display key="Long_Title_UpdateProfile"/></p>
                    </td>
                </tr>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.shortcutsEnabled%>">
                <tr>
                    <td class="menubutton_key">
                        <a id="button_Shortcuts" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.Shortcuts.servletUrl()%>'/>">
                            <pwm:display key="Title_Shortcuts"/>
                        </a>
                    </td>
                    <td>
                        <p><pwm:display key="Long_Title_Shortcuts"/></p>
                    </td>
                </tr>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.accountInfoEnabled%>">
                <tr>
                    <td class="menubutton_key">
                        <a id="button_UserInformation" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.AccountInformation.servletUrl()%>'/>">
                            <pwm:display key="Title_UserInformation"/>
                        </a>
                    </td>
                    <td>
                        <p><pwm:display key="Long_Title_UserInformation"/></p>
                    </td>
                </tr>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.helpdeskAvailable%>">
                <tr>
                    <td class="menubutton_key">
                        <a id="button_Helpdesk" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.Helpdesk.servletUrl()%>'/>">
                            <pwm:display key="Title_Helpdesk"/>
                        </a>
                    </td>
                    <td>
                        <p><pwm:display key="Long_Title_Helpdesk"/></p>
                    </td>
                </tr>
            </pwm:if>


            <pwm:if test="<%=PwmIfTest.DeleteAccountAvailable%>">
                <tr>
                    <td class="menubutton_key">
                        <a id="button_Helpdesk" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.SelfDelete.servletUrl()%>'/>">
                            <pwm:display key="Title_DeleteAccount"/>
                        </a>
                    </td>
                    <td>
                        <p><pwm:display key="Long_Title_DeleteAccount"/></p>
                    </td>
                </tr>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.guestRegistrationAvailable%>">
                <tr>
                    <td class="menubutton_key">
                        <a id="button_GuestRegistration" class="menubutton" href="<pwm:url url='<%=PwmServletDefinition.GuestRegistration.servletUrl()%>' addContext="true"/>">
                            <pwm:display key="Title_GuestRegistration"/>
                        </a>
                    </td>
                    <td>
                        <p><pwm:display key="Long_Title_GuestRegistration"/></p>
                    </td>
                </tr>
            </pwm:if>
        </pwm:if>
        <pwm:if test="<%=PwmIfTest.permission%>" permission="<%=Permission.PWMADMIN%>">
            <tr>
                <td class="menubutton_key">
                    <a id="button_Admin" class="menubutton" href="<pwm:url url='<%=PwmServletDefinition.Admin.servletUrl()%>' addContext="true"/> ">
                            <pwm:display key="Title_Admin"/>
                    </a>
                </td>
                <td>
                    <p><pwm:display key="Long_Title_Admin"/></p>
                </td>
            </tr>
        </pwm:if>
        </table>
    </div>
    <div class="push"></div>
</div>
<%@ include file="../WEB-INF/jsp/fragment/footer.jsp" %>
</body>
</html>
