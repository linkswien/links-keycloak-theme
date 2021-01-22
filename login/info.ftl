<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#if messageHeader??>
        ${messageHeader}
        <#else>
        ${message.summary}
        </#if>
    <#elseif section = "form">
    <div id="kc-info-message">
        <p class="instruction"><#if requiredActions??>Um deinen LINKS Account einzurichten, müssen noch zwei Schritte erledigt werden<#list requiredActions>: <b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b></#list><#else></#if></p>
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri?has_content>
                <p><a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            <#elseif actionUri?has_content>
                <p><a href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a></p>
            <#elseif (client.baseUrl)?has_content>
                <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            </#if>
        </#if>
        <#if !requiredActions??>
            <p>Hier geht's zum <a href="https://wiki.links-wien.at">LINKS Wiki</a>, zur <a href="https://cloud.links-wien.at">LINKS Cloud</a> und zu deinen <a href="https://sso.links-wien.at">LINKS Account Einstellungen</a>.</p>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>
