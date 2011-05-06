<%@page session="false" taglibs="c,cms,fmt,fn" %>
<fmt:setLocale value="${cms.locale}" />
<fmt:bundle basename="com.alkacon.opencms.v8.search.frontend">

<cms:formatter var="content" val="value">
	<c:set var="formlink"><cms:link>${content.filename}</cms:link></c:set>
	<c:set var="boxschema"><cms:elementsetting name="boxschema" default="box_schema1" /></c:set>
	<div class="box ${boxschema}">
	<c:choose>
		<c:when test="${fn:endsWith(formlink, content.filename)}">
			<h4>Search Error</h4>
			<div class="boxbody">No detail page for search page defined in sitemap.</div>
		</c:when>
		<c:otherwise>
			<h4>${value.Title}</h4>
		
			<div class="boxbody">
			<c:if test="${value.Text.isSet}">
				<p>${cms:stripHtml(value.Text)}</p>
			</c:if>
			<form id="searchFormSide" name="searchForm" action="${formlink}" method="post">
				<input type="hidden" name="searchaction" value="search" />
				<input type="hidden" name="searchPage" value="1" />
				<input type="text" name="query" value="${search.query}" />
				<input type="submit" name="submit" value="<fmt:message key="search.button" />" />
			</form>
			</div>
		</c:otherwise>
	</c:choose>
	</div>
</cms:formatter>
</fmt:bundle>