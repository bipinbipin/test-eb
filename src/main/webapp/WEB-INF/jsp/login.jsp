<% /** Contributors:   Josh Nickleby  */%>

<%@include file="includes/header.jsp"%>
<%@include file="includes/navbar.jsp"%>

<!-- todo: figure out styling and needed code or if this works. -->

<div class="container blueBackground">

    <div class="col-sm-6">

    </div>

    <br/>

    <div class="col-sm-4">
        <form id="form" action="<c:url value='/login.do'/>" method="POST">
            <c:if test="${not empty param.err}">
                <div class="msg-container error text-white">
                    <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
                </div>
            </c:if>

            <c:if test="${not empty param.out}">
                <div class="msg-container logout text-white">
                    You've logged out successfully.
                </div>
            </c:if>

            <c:if test="${not empty param.time}">
                <div class="msg-container time text-white">
                    You've been logged out due to inactivity.
                </div>
            </c:if>

            <span class="text-white">Username:</span>
            <input type="text" name="username" value=""/>
            <br/><br/>
            <span class="text-white">Password:</span>
            <input type="password" name="password" value="">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <br/><br/>

            <input type="submit" value="login" name="submit" class="btn btn-default" />
        </form>
    </div>
</div>

<%@include file="includes/footer.jsp"%>