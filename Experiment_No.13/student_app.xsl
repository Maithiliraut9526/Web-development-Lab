<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <head>
            <title>Student Management System</title>
            <style>
                body { font-family: 'Segoe UI', sans-serif; background-color: #f4f7f6; margin: 40px; }
                table { width: 100%; border-collapse: collapse; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
                th { background-color: #2c3e50; color: white; padding: 15px; }
                td { padding: 12px; background-color: white; border-bottom: 1px solid #ddd; text-align: center; }
                .pass { color: #27ae60; font-weight: bold; }
                .fail { color: #e74c3c; font-weight: bold; }
                .distinction { background-color: #f1c40f !important; }
                .probation-row { background-color: #fff5f5; }
            </style>
        </head>
        <body>
            <h2 style="text-align:center; color:#2c3e50;">Student Application Portal</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Score</th>
                    <th>Attendance (%)</th>
                    <th>Result</th>
                </tr>
                <xsl:for-each select="university/student">
                    <tr>
                        <!-- Highlight row if on Probation -->
                        <xsl:if test="@status = 'Probation'">
                            <xsl:attribute name="class">probation-row</xsl:attribute>
                        </xsl:if>

                        <td><xsl:value-of select="@id"/></td>
                        <td><xsl:value-of select="bio/name"/></td>
                        <td><xsl:value-of select="academic/dept"/></td>
                        
                        <!-- Conditional Styling for Score -->
                        <td>
                            <xsl:if test="academic/score &gt; 85">
                                <xsl:attribute name="class">distinction</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="academic/score"/>
                        </td>

                        <td><xsl:value-of select="academic/attendance"/>%</td>

                        <!-- Result Logic using Choose/When -->
                        <td>
                            <xsl:choose>
                                <xsl:when test="academic/score &gt;= 40">
                                    <span class="pass">PASSED</span>
                                </xsl:when>
                                <xsl:otherwise>
                                    <span class="fail">FAILED</span>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>