<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>HADS</h2>  
  <table border="1"> 
	<tr bgcolor="#9acd32">   
        <th style="text-align:left">Codigo</th> 
        <th style="text-align:left">Descripccion</th>
	<th style="text-align:left">Horas estimadas</th>
	</tr> 

<xsl:for-each select="tareas/tarea"> 
 <xsl:sort select="hestimadas" />
 <tr>
	<td> 
	<xsl:value-of select="codigo"/> 
	</td>
	<td> 
	<xsl:value-of select="descripcion"/> 
	</td> 
	<td> 
	<xsl:value-of select="hestimadas"/> 
	</td>


      </tr>   
        </xsl:for-each>    
     </table>   
    </body>   
  </html>  
 </xsl:template>

</xsl:stylesheet>



