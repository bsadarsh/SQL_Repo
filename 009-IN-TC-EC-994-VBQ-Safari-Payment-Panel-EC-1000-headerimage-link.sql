
declare @brandId int
declare @headerHtml nvarchar(max)
declare @footerHtml nvarchar(max)
declare @languageIso char(2)
declare @logoLink nvarchar(max)
declare @CurrentYear varchar(4)

SELECT @CurrentYear = CONVERT(varchar(4), YEAR(getdate()))

if (LOWER(@@SERVERNAME) like '%prod%') 
begin
	set @logoLink = 'http://www.vinicioboutique.com/';
end
else
begin
	set @logoLink = 'http://vinicio-dev.extranet.alpenite.com/';
end

-- VBQ Italian -->

	Set @brandId = 12
	Set @languageIso = 'it'
Select @headerHtml = '
<style>

.topbar {
    background: #000000;
    position: relative;
    font-size: 92.3%;
    border: 1px solid rgba(213,211,206,.7);
	height: 100px;
}
.topbar, .topbar a {
    color: #fff;
}

.navbar-brand {
    float: none;
    font-size: 1.3846153846153846em;
    display: block;
    height: auto;
    margin: 0 auto;
    text-align: center;
    line-height: 98px;
	padding: 0;
}

.navbar-brand img {
    max-height: 25px;
    padding: 0;
}

.navbar-brand > img {
    display: inline;
}


</style>

<div class="topbar">
	<div class="container-fluid topbar-wap">
		<div class="row">
			<div class="col-sm-4 hide-xs">
			</div>
			<div class="col-sm-4 col-xs-12">
				<a class="navbar-brand" href="'+ @logoLink + '">
					<img class="logo" alt="" src="http://vinicio-dev.extranet.alpenite.com/public/svg/logo_white.svg">
				</a>
			</div>
			<div class="col-sm-4 hide-xs">
				<div class="right-topbar">
					
				</div>
			</div>
		</div>
	</div>
</div>
	'
	Select @footerHtml = '
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<style>


#DIV_6, #DIV_11, #DIV_16, #DIV_22 {
    box-sizing: border-box;
    color: rgb(255, 255, 255);
    display: inline-block;
    height: 30px;
    text-align: center;
    text-size-adjust: 100%;
    width: 30px;
    column-rule-color: rgb(255, 255, 255);
    perspective-origin: 15px 15px;
    transform-origin: 15px 15px;
    border: 1px solid rgb(255, 255, 255);
    font: normal normal normal normal 12px / 30px "Helvetica Neue", Helvetica, Arial, sans-serif;
    margin: 0px 0px 15px;
    outline: rgb(255, 255, 255) none 0px;
}/*#DIV_6, #DIV_11, #DIV_16, #DIV_22*/



#DIV_8 {
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    height: 60px;
    text-align: center;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 102.5px 30px;
    transform-origin: 102.5px 30px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
}/*#DIV_8*/

#DIV_9, #DIV_14 {
    bottom: 0px;
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    float: left;
    height: 155px;
    left: 0px;
    min-height: 1px;
    position: relative;
    right: 0px;
    text-size-adjust: 100%;
    top: 0px;
    width: 25%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 117.5px 77.5px;
    transform-origin: 117.5px 77.5px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
    padding: 0px 15px;
}/*#DIV_9, #DIV_14*/

#DIV_10, #DIV_15 {
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    height: 155px;
    text-align: center;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 102.5px 77.5px;
    transform-origin: 102.5px 77.5px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
    padding: 45px 0px;
}/*#DIV_10, #DIV_15*/


#DIV_13, #DIV_18 {
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    height: 20px;
    text-align: center;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 102.5px 10px;
    transform-origin: 102.5px 10px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
}/*#DIV_13, #DIV_18*/


#A_19 {
    background-position: 0px 0px;
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    text-align: center;
    word-wrap: break-word;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    background: rgba(0, 0, 0, 0) none repeat scroll 0px 0px / auto padding-box border-box;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
    transition: background-color 0.3s ease 0s, border-color 0.3s ease 0s, text-color 0.3s ease 0s;
}/*#A_19*/

#DIV_20 {
    bottom: 0px;
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    float: left;
    height: 236.531px;
    left: 0px;
    min-height: 1px;
    position: relative;
    right: 0px;
    text-size-adjust: 100%;
    top: 0px;
    width: 235px;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 117.5px 118.266px;
    transform-origin: 117.5px 118.266px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
    padding: 0px 15px;
}/*#DIV_20*/

#DIV_21 {
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    height: 236.531px;
    text-align: center;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 102.5px 118.266px;
    transform-origin: 102.5px 118.266px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
    padding: 45px 0px;
}/*#DIV_21*/



#DIV_24 {
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    height: 90.7656px;
    text-align: center;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 102.5px 45.375px;
    transform-origin: 102.5px 45.375px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
}/*#DIV_24*/

#P_25, #P_26 {
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    height: 40px;
    text-align: center;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 102.5px 20px;
    transform-origin: 102.5px 20px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    margin: 0px 0px 10.7692px;
    outline: rgb(161, 170, 181) none 0px;
}/*#P_25, #P_26*/

.footerCol{
	display:table-cell;
	text-align:center;
	justify-content: center
}

.eswTerms{  
	background:rgb(18, 23, 27);
}
.eswTerms hr{ 
	display: none; 
}

footer{ 
	background:#12171b; 
	color:#a1aab5
}
	
.footer .footer-info {
    color: #a1aab5;
    padding: 40px 0;
    position: relative;
}

.footer .footer-contact, .footer .footer-info {
    border-top: 1px solid #b4b4bc;
}
</style>

<div class="row no-margin" style="display:table;width:100%;">

<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 footerCol" style="padding-top: 45px;" >
	<div id="DIV_6">
		<i class="fa fa-map-marker"></i>
	</div>
	<div id="DIV_8">
		2016 VINICIO S.R.L. Via Felice Musazzi 2 - LEGNANO (MI), Italy
	</div>
					
</div>

<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 footerCol" >
	<div id="DIV_10">
		<div id="DIV_11">
		<i class="fa fa-phone"></i>
		</div>
		<div id="DIV_13">
			+39 0331 441957
		</div>
	</div>
</div>

<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 footerCol">

	<div id="DIV_15">
		<div id="DIV_16">
			<i class="fa fa-envelope-o"></i>
		</div>
		<div id="DIV_18">
			 <a href="mailto:customerservice@vinicioboutique.com" id="A_19">customerservice@vinicioboutique.com</a>
		</div>
	</div>
				
</div>

<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 footerCol">

	<div id="DIV_21">
		<div id="DIV_22">
			<i class="fa fa-clock-o"></i>
		</div>
		<div id="DIV_24">
			<p id="P_25">
				Venerdì dalle 8.30 alle 17.30 (GMT+1)
			</p>
			<p id="P_26">
				Sabato dalle 8.30 alle 12.30 (GMT+1)
			</p>
		</div>
	</div>
</div>

</div>

<div class="row no-margin no-padding">

<div class="footer-info">			
						
		<div class="text-center">
			<div class="copyright text-center">
				Copyright © '+@CurrentYear+'. <br>
				Tutti i diritti riservati.
			</div>
		</div>						
					
	</div>
</div>

'

BEGIN TRANSACTION

BEGIN TRY

	IF EXISTS (SELECT * FROM Parties.CheckoutHtml  WHERE BrandId = @brandId and LanguageIso = @languageIso)
		UPDATE 
			Parties.CheckoutHtml 
		Set
			HeaderHtml = @headerHtml,
			FooterHtml = @footerHtml,
			MobileHeaderHtml = @headerHtml,
			MobileFooterHtml = @footerHtml
		Where
			BrandId = @brandId
			AND LanguageIso = @languageIso
	ELSE
		INSERT INTO 
			Parties.CheckoutHtml 
		VALUES(
				@brandId,
				@headerHtml,
				@footerHtml,
				@languageIso,
				NULL,
				NULL,
				@headerHtml,
				@footerHtml,
				NULL,
				NULL,
				NULL,
				NULL
			)

COMMIT TRANSACTION

END TRY

BEGIN CATCH
  PRINT 'An error occurred: Italian version' +  ERROR_MESSAGE()
  ROLLBACK TRANSACTION
END CATCH


-- VBQ -> English

Set @languageIso = 'en'

	Select @footerHtml = '
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<style>


#DIV_6, #DIV_11, #DIV_16, #DIV_22 {
    box-sizing: border-box;
    color: rgb(255, 255, 255);
    display: inline-block;
    height: 30px;
    text-align: center;
    text-size-adjust: 100%;
    width: 30px;
    column-rule-color: rgb(255, 255, 255);
    perspective-origin: 15px 15px;
    transform-origin: 15px 15px;
    border: 1px solid rgb(255, 255, 255);
    font: normal normal normal normal 12px / 30px "Helvetica Neue", Helvetica, Arial, sans-serif;
    margin: 0px 0px 15px;
    outline: rgb(255, 255, 255) none 0px;
}/*#DIV_6, #DIV_11, #DIV_16, #DIV_22*/



#DIV_8 {
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    height: 60px;
    text-align: center;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 102.5px 30px;
    transform-origin: 102.5px 30px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
}/*#DIV_8*/

#DIV_9, #DIV_14 {
    bottom: 0px;
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    float: left;
    height: 155px;
    left: 0px;
    min-height: 1px;
    position: relative;
    right: 0px;
    text-size-adjust: 100%;
    top: 0px;
    width: 25%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 117.5px 77.5px;
    transform-origin: 117.5px 77.5px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
    padding: 0px 15px;
}/*#DIV_9, #DIV_14*/

#DIV_10, #DIV_15 {
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    height: 155px;
    text-align: center;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 102.5px 77.5px;
    transform-origin: 102.5px 77.5px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
    padding: 45px 0px;
}/*#DIV_10, #DIV_15*/


#DIV_13, #DIV_18 {
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    height: 20px;
    text-align: center;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 102.5px 10px;
    transform-origin: 102.5px 10px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
}/*#DIV_13, #DIV_18*/


#A_19 {
    background-position: 0px 0px;
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    text-align: center;
    word-wrap: break-word;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    background: rgba(0, 0, 0, 0) none repeat scroll 0px 0px / auto padding-box border-box;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
    transition: background-color 0.3s ease 0s, border-color 0.3s ease 0s, text-color 0.3s ease 0s;
}/*#A_19*/

#DIV_20 {
    bottom: 0px;
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    float: left;
    height: 236.531px;
    left: 0px;
    min-height: 1px;
    position: relative;
    right: 0px;
    text-size-adjust: 100%;
    top: 0px;
    width: 235px;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 117.5px 118.266px;
    transform-origin: 117.5px 118.266px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
    padding: 0px 15px;
}/*#DIV_20*/

#DIV_21 {
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    height: 236.531px;
    text-align: center;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 102.5px 118.266px;
    transform-origin: 102.5px 118.266px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
    padding: 45px 0px;
}/*#DIV_21*/



#DIV_24 {
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    height: 90.7656px;
    text-align: center;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 102.5px 45.375px;
    transform-origin: 102.5px 45.375px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(161, 170, 181) none 0px;
}/*#DIV_24*/

#P_25, #P_26 {
    box-sizing: border-box;
    color: rgb(161, 170, 181);
    height: 40px;
    text-align: center;
    text-size-adjust: 100%;
    column-rule-color: rgb(161, 170, 181);
    perspective-origin: 102.5px 20px;
    transform-origin: 102.5px 20px;
    border: 0px none rgb(161, 170, 181);
    font: normal normal normal normal 14px / 20px "Helvetica Neue", Helvetica, Arial, sans-serif;
    margin: 0px 0px 10.7692px;
    outline: rgb(161, 170, 181) none 0px;
}/*#P_25, #P_26*/

.footerCol{
	display:table-cell;
	text-align:center;
	justify-content: center
}

.eswTerms{  
	background:rgb(18, 23, 27);
}
.eswTerms hr{ 
	display: none; 
}

footer{ 
	background:#12171b; 
	color:#a1aab5
}
	
.footer .footer-info {
    color: #a1aab5;
    padding: 40px 0;
    position: relative;
}

.footer .footer-contact, .footer .footer-info {
    border-top: 1px solid #b4b4bc;
}
</style>

<div class="row no-margin" style="display:table;width:100%;">

<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 footerCol" style="padding-top: 45px;" >
	<div id="DIV_6">
		<i class="fa fa-map-marker"></i>
	</div>
	<div id="DIV_8">
		2016 VINICIO S.R.L. Via Felice Musazzi 2 - LEGNANO (MI), Italy
	</div>
					
</div>

<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 footerCol" >
	<div id="DIV_10">
		<div id="DIV_11">
		<i class="fa fa-phone"></i>
		</div>
		<div id="DIV_13">
			+39 0331 441957
		</div>
	</div>
</div>

<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 footerCol">

	<div id="DIV_15">
		<div id="DIV_16">
			<i class="fa fa-envelope-o"></i>
		</div>
		<div id="DIV_18">
			 <a href="mailto:customerservice@vinicioboutique.com" id="A_19">customerservice@vinicioboutique.com</a>
		</div>
	</div>
				
</div>

<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 footerCol">

	<div id="DIV_21">
		<div id="DIV_22">
			<i class="fa fa-clock-o"></i>
		</div>
		<div id="DIV_24">
			<p id="P_25">
				Monday – Friday from 8:30 – 17:30 (GMT+1)
			</p>
			<p id="P_26">
				Saturday from 8:30 – 12:30 (GMT+1)
			</p>
		</div>
	</div>
</div>

</div>

<div class="row no-margin no-padding">

<div class="footer-info">			
						
		<div class="text-center">
			<div class="copyright text-center">
				Copyright © '+@CurrentYear+'. <br>
				All Rights Reserved.
			</div>
		</div>						
					
	</div>
</div>

'

BEGIN TRANSACTION

BEGIN TRY

	IF EXISTS (SELECT * FROM Parties.CheckoutHtml  WHERE BrandId = @brandId and LanguageIso = @languageIso)
		UPDATE 
			Parties.CheckoutHtml 
		Set
			HeaderHtml = @headerHtml,
			FooterHtml = @footerHtml,
			MobileHeaderHtml = @headerHtml,
			MobileFooterHtml = @footerHtml
		Where
			BrandId = @brandId
			AND LanguageIso = @languageIso
	ELSE
		INSERT INTO 
			Parties.CheckoutHtml 
		VALUES(
				@brandId,
				@headerHtml,
				@footerHtml,
				@languageIso,
				NULL,
				NULL,
				@headerHtml,
				@footerHtml,
				NULL,
				NULL,
				NULL,
				NULL
			)

COMMIT TRANSACTION

END TRY

BEGIN CATCH
  PRINT 'An error occurred: English version' +  ERROR_MESSAGE()
  ROLLBACK TRANSACTION
END CATCH