<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<mt:layout_user title="Payment">

	<jsp:attribute name="content">
	
	
	<style>
	#invoice-POS{
  box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);
  padding:10mm;
  margin: 50px auto;
  width: 55%;
  background: #FFF;
  
  
::selection {background: #f31544; color: #FFF;}
::moz-selection {background: #f31544; color: #FFF;}
h1{
  font-size: 1.5em;
  color: #222;
}
h2{font-size: .9em;}
h3{
  font-size: 1.2em;
  font-weight: 300;
  line-height: 2em;
}
p{
  font-size: .7em;
  color: #666;
  line-height: 1.2em;
}
 
#top, #mid,#bot{ /* Targets all id with 'col-' */
  border-bottom: 1px solid #EEE;
}

#top{min-height: 100px;}
#mid{min-height: 80px;} 
#bot{ min-height: 50px;}

#top .logo{
  //float: left;
  height: 60px;
  width: 60px;
  background: url(/resources/user/images/logosite.png) no-repeat;
  background-size: 60px 60px;
}
.clientlogo{
  float: left;
  height: 60px;
  width: 60px;
  background: url(http://michaeltruong.ca/images/client.jpg) no-repeat;
  background-size: 60px 60px;
  border-radius: 50px;
}
.info{
  display: block;
  //float:left;
  margin-left: 0;
}
.title{
  float: right;
}
.title p{text-align: right;} 
table{
  width: 100%;
  border-collapse: collapse;
}
td{
  //padding: 5px 0 5px 15px;
  //border: 1px solid #EEE
}
.tabletitle{
  //padding: 5px;
  font-size: .5em;
  background: #EEE;
}
.service{border-bottom: 1px solid #EEE;}
.item{width: 24mm;}
.itemtext{font-size: .5em;}

#legalcopy{
  margin-top: 5mm;
}

  
  
}

.main_info table{

width: 100%;

}
	</style>
	<div class="container">
	
	
  <div id="invoice-POS">
    
    <center id="top">
      <div class="logo"><img src="${pageContext.request.contextPath }/resources/user/images/logosite.png"></div>
      <div class="info"> 
      	<h1 style="color: #eea412; font-size: 40px;">Quiz Online</h1>
        <h2>Login Memory</h2>
      </div>
					<!--End Info-->
    </center>
				<!--End InvoiceTop-->
    <hr>
    <div id="mid">
      <div class="info">
        <h2>Contact Info</h2>
        <p> 
            Address &nbsp;&nbsp;: street city, state 0000</br>
            Email   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: appchateproject@gmail.com</br>
            Website &nbsp;&nbsp;&nbsp;: quizonline.com</br>
            Phone   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: +84 123456789</br>
        </p>
      </div>
       <div class="info">
        <h2>Receipt Info</h2>
        <p> 
            Title   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : ${pay.title }</br>
            Date    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <fmt:formatDate var="datePaid" value="${pay.datePaid}"
														pattern="dd/MM/yyyy HH:mm:ss" />
									${datePaid }</br>
            Payment  &nbsp;: ${pay.payment }</br>
        </p>
      </div>
    </div>
				<!--End Invoice Mid-->
    
    <div id="bot">

          <div id="table" class="main_info">
            <table>
              <tr class="tabletitle" style="
    background-color: gainsboro;
">
                <td class="item"><h2>Item</h2></td>
                <td class="Hours"><h2>Qty</h2></td>
                <td class="Rate"><h2>Sub Total</h2></td>
              </tr>

              <tr class="service">
                <td class="tableitem"><p class="itemtext">${pay.title }</p></td>
                <td class="tableitem"><p class="itemtext">1</p></td>
                <td class="tableitem"><p class="itemtext">$ ${pay.fee }</p></td>
              </tr>

              

            
              <tr class="tabletitle" style="
    background-color: gainsboro;
">
                <td></td>
                <td class="Rate"><h2>Total</h2></td>
                <td class="payment"><h2 style="color:red;">$ ${pay.fee }</h2></td>
              </tr>

            </table>
          </div>
					<!--End Table-->

          <div id="legalcopy" style="
    padding-top: 30px;
">
            <p class="legal">
							<strong>Thank you for your business!</strong>  Payment is expected within 31 days; please process this invoice within that time. There will be a 5% interest charge per month on late invoices. 
            </p>
          </div>

        </div>
				<!--End InvoiceBot-->
  </div>
			<!--End Invoice-->
	</div>
	
	
	</jsp:attribute>
</mt:layout_user>

