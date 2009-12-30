<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="Provider of managed software services" />
<meta name="keywords" content="eMarket,eProcurement,eInvoice" />
<meta name="author" content="3itb: Femi Aluko" />
<title><g:layoutTitle default="eMarket" /></title>
<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
<link rel="stylesheet" href="${createLinkTo(dir:'js',file:'ext-2.2/resources/css/ext-all.css')}"></link>
<script type="text/javascript" src="${createLinkTo(dir:'js',file:'ext-2.2/adapter/ext/ext-base.js')}"></script>
<script type="text/javascript" src="${createLinkTo(dir:'js',file:'ext-2.2/ext-all.js')}"></script>

<g:layoutHead />
<g:javascript library="application" />
<g:javascript library="prototype" />
</head>
<body onload="${pageProperty(name:'body.onload')}">
  <!-- ##### Header ##### -->
  <div id="north">
   <g:render template="/common/header" />
  </div>
  
 <!-- ##### Left Navigation Bar ##### -->
   <div id="admin">
   <g:render template="/common/adminnav" />
  </div>

  <div id="west">
   <g:render template="/common/leftnav" />
  </div>
  
  <!-- ##### Content Area ##### -->
  <div id="center">
    <g:layoutBody />	
  </div> 

  <!-- ##### Footer ##### -->
  <div id="south">
   <g:render template="/common/footer" />
  </div>
</body>
</html>
