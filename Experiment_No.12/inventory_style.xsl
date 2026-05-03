<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <head>
            <style>
                body { font-family: 'Segoe UI', Arial, sans-serif; margin: 40px; background-color: #f0f2f5; }
                .container { background: white; padding: 20px; border-radius: 12px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
                table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                th { background-color: #2c3e50; color: white; padding: 12px; text-align: left; }
                td { padding: 12px; border-bottom: 1px solid #eee; }
                
                /* Class for low stock warning */
                .low-stock { color: #d35400; font-weight: bold; background-color: #fff5e6; }
                .price-tag { color: #27ae60; font-weight: bold; }
                .badge { padding: 4px 8px; border-radius: 4px; font-size: 0.8em; background: #e0e0e0; }
            </style>
        </head>
        <body>
            <div class="container">
                <h2>Warehouse Stock Report</h2>
                <table>
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Stock Level</th>
                    </tr>
                    <xsl:for-each select="inventory/product">
                        <tr>
                            <!-- Conditional Logic: If stock is less than 10, apply low-stock class -->
                            <xsl:if test="stock &lt; 10">
                                <xsl:attribute name="class">low-stock</xsl:attribute>
                            </xsl:if>

                            <td><xsl:value-of select="id"/></td>
                            <td><xsl:value-of select="name"/></td>
                            <td><span class="badge"><xsl:value-of select="@category"/></span></td>
                            <td class="price-tag">$<xsl:value-of select="price"/></td>
                            <td>
                                <xsl:value-of select="stock"/>
                                <xsl:if test="stock &lt; 10"> (REORDER SOON)</xsl:if>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </div>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>