{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
*
 ********************************************************************************/
-->*}
{strip}
	<div class="col-xs-10 col-sm-9 col-md-4 margin0px">
		<div class="moduleIcon">
			<span class="detailViewIcon userIcon-{$MODULE}" {if $COLORLISTHANDLERS}style="background-color: {$COLORLISTHANDLERS['background']};color: {$COLORLISTHANDLERS['text']};"{/if}></span>
		</div>
		<div class="paddingLeft5px pull-left">
			<h4 class="paddingLeft5px recordLabel pushDown marginbottomZero" title="{$RECORD->getName()}">
				{foreach item=NAME_FIELD from=$MODULE_MODEL->getNameFields()}
					{assign var=FIELD_MODEL value=$MODULE_MODEL->getField($NAME_FIELD)}
						{if $FIELD_MODEL->getPermissions()}
							<span class="moduleColor_{$MODULE_NAME} {$NAME_FIELD}">{$RECORD->get($NAME_FIELD)}</span>&nbsp;
						{/if}
				{/foreach}
			</h4>
			{assign var=RELATED_TO value=$RECORD->get('linktoaccountscontacts')}
			{if !empty($RELATED_TO)}
			<div class="paddingLeft5px">
				<span class="muted">{vtranslate('Related to',$MODULE_NAME)} - </span>
				{$RECORD->getDisplayValue('linktoaccountscontacts')}
			</div>
			{/if}
			<div class="paddingLeft5px">
				<span class="muted">
					{vtranslate('Assigned To',$MODULE_NAME)}: {$RECORD->getDisplayValue('assigned_user_id')}
					{assign var=SHOWNERS value=$RECORD->getDisplayValue('shownerid')}
					{if $SHOWNERS != ''}
					<br/>{vtranslate('Share with users',$MODULE_NAME)} {$SHOWNERS}
					{/if}
				</span>
			</div>
		</div>
	</div>
	{include file='DetailViewHeaderFields.tpl'|@vtemplate_path:$MODULE_NAME}
{/strip}
