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
        <div class="container">
        <pwm:if test="<%=PwmIfTest.endUserFunctionalityAvailable%>" negate="true">
            <p><pwm:display key="Warning_NoEndUserModules" bundle="Config"/></p>
            <br/>
        </pwm:if>
        <pwm:if test="<%=PwmIfTest.endUserFunctionalityAvailable%>">
            <pwm:if test="<%=PwmIfTest.permission%>" permission="<%=Permission.CHANGE_PASSWORD%>">
                <div class="row">
                    <div class="col-sm-4 menubutton_key">
                        <a id="button_ChangePassword" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.PrivateChangePassword.servletUrl()%>'/>">
                            <pwm:display key="Title_ChangePassword"/>
                        </a>
                    </div>
                    <div class="col-sm-8">
                        <p><pwm:display key="Long_Title_ChangePassword"/></p>
                    </div>
                </div>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.peopleSearchEnabled%>">
                <pwm:if test="<%=PwmIfTest.permission%>" permission="<%=Permission.PEOPLE_SEARCH%>">
                    <div class="row">
                        <div class="col-sm-4 menubutton_key">
                            <a id="button_PeopleSearch" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.PrivatePeopleSearch.servletUrl()%>'/>#/search">
                                <pwm:display key="Title_PeopleSearch"/>
                            </a>
                        </div>
                        <div class="col-sm-8">
                            <p><pwm:display key="Long_Title_PeopleSearch"/></p>
                        </div>
                    </div>
                </pwm:if>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.orgChartEnabled%>">
                <pwm:if test="<%=PwmIfTest.permission%>" permission="<%=Permission.PEOPLE_SEARCH%>">
                    <div class="row">
                        <div class="col-sm-4 menubutton_key">
                            <a id="button_OrgChart" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.PrivatePeopleSearch.servletUrl()%>'/>#/orgchart">
                                <pwm:display key="Title_OrgChart"/>
                            </a>
                        </div>
                        <div class="col-sm-8">
                            <p><pwm:display key="Title_OrgChart"/></p>
                        </div>
                    </div>
                </pwm:if>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.setupChallengeEnabled%>">
                <pwm:if test="<%=PwmIfTest.permission%>" permission="<%=Permission.SETUP_RESPONSE%>">
                    <div class="row">
                        <div class="col-sm-4 menubutton_key">
                            <a id="button_SetupResponses" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.SetupResponses.servletUrl()%>'/>">
                                <pwm:display key="Title_SetupResponses"/>
                            </a>
                        </div>
                        <div class="col-sm-8">
                            <p><pwm:display key="Long_Title_SetupResponses"/></p>
                        </div>
                    </div>
                </pwm:if>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.otpSetupEnabled%>">
                <div class="row">
                    <div class="col-sm-4 menubutton_key">
                        <a id="button_SetupOtpSecret" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.SetupOtp.servletUrl()%>'/>">
                            <pwm:display key="Title_SetupOtpSecret"/>
                        </a>
                    </div>
                    <div class="col-sm-8">
                        <p><pwm:display key="Long_Title_SetupOtpSecret"/></p>
                    </div>
                </div>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.updateProfileAvailable%>">
                <div class="row">
                    <div class="col-sm-4 menubutton_key">
                        <a id="button_UpdateProfile" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.UpdateProfile.servletUrl()%>'/>">
                            <pwm:display key="Title_UpdateProfile"/>
                        </a>
                    </div>
                    <div class="col-sm-8">
                        <p><pwm:display key="Long_Title_UpdateProfile"/></p>
                    </div>
                </div>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.shortcutsEnabled%>">
            <div class="row">
                <div class="col-sm-4 menubutton_key">
                        <a id="button_Shortcuts" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.Shortcuts.servletUrl()%>'/>">
                            <pwm:display key="Title_Shortcuts"/>
                        </a>
                    </div>
                    <div class="col-sm-8">
                        <p><pwm:display key="Long_Title_Shortcuts"/></p>
                    </div>
                </div>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.accountInfoEnabled%>">
            <div class="row">
                <div class="col-sm-4 menubutton_key">
                        <a id="button_UserInformation" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.AccountInformation.servletUrl()%>'/>">
                            <pwm:display key="Title_UserInformation"/>
                        </a>
                    </div>
                    <div class="col-sm-8">
                        <p><pwm:display key="Long_Title_UserInformation"/></p>
                    </div>
                </div>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.helpdeskAvailable%>">
            <div class="row">
                <div class="col-sm-4 menubutton_key">
                        <a id="button_Helpdesk" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.Helpdesk.servletUrl()%>'/>">
                            <pwm:display key="Title_Helpdesk"/>
                        </a>
                    </div>
                    <div class="col-sm-8">
                        <p><pwm:display key="Long_Title_Helpdesk"/></p>
                    </div>
                </div>
            </pwm:if>


            <pwm:if test="<%=PwmIfTest.DeleteAccountAvailable%>">
            <div class="row">
                <div class="col-sm-4 menubutton_key">
                        <a id="button_DeleteAccount" class="menubutton" href="<pwm:url addContext="true" url='<%=PwmServletDefinition.SelfDelete.servletUrl()%>'/>">
                            <pwm:display key="Title_DeleteAccount"/>
                        </a>
                    </div>
                    <div class="col-sm-8">
                        <p><pwm:display key="Long_Title_DeleteAccount"/></p>
                    </div>
                </div>
            </pwm:if>

            <pwm:if test="<%=PwmIfTest.guestRegistrationAvailable%>">
                <div class="row">
                    <div class="col-sm-4 menubutton_key">
                        <a id="button_GuestRegistration" class="menubutton" href="<pwm:url url='<%=PwmServletDefinition.GuestRegistration.servletUrl()%>' addContext="true"/>">
                            <pwm:display key="Title_GuestRegistration"/>
                        </a>
                    </div>
                    <div class="col-sm-8">
                        <p><pwm:display key="Long_Title_GuestRegistration"/></p>
                    </div>
                </div>
            </pwm:if>
        </pwm:if>
        <pwm:if test="<%=PwmIfTest.permission%>" permission="<%=Permission.PWMADMIN%>">
            <div class="row">
                <div class="col-sm-4 menubutton_key">
                    <a id="button_Admin" class="menubutton" href="<pwm:url url='<%=PwmServletDefinition.Admin.servletUrl()%>' addContext="true"/> ">
                            <pwm:display key="Title_Admin"/>
                    </a>
                </div>
                <div class="col-sm-8">
                    <p><pwm:display key="Long_Title_Admin"/></p>
                </div>
            </div>
        </pwm:if>
        </div>
    </div>
    <div class="push"></div>
</div>
<%@ include file="../WEB-INF/jsp/fragment/footer.jsp" %>
</body>
</html>
