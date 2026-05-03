<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <head>
            <style>
                body { font-family: 'Segoe UI', sans-serif; background: #f4f4f9; padding: 20px; }
                table { width: 100%; border-collapse: collapse; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
                th { background: #1a3a5f; color: white; padding: 15px; }
                td { padding: 12px; border-bottom: 1px solid #ddd; text-align: center; }
                .pass { color: #27ae60; font-weight: bold; }
                .fail { color: #e74c3c; font-weight: bold; }
                .probation { background-color: #ffeaea; }
            </style>
        </head>
        <body>
            <h2 style="text-align:center;">University Student Management System</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Dept</th>
                    <th>Score</th>
                    <th>Result</th>
                    <th>Attendance</th>
                </tr>
                <xsl:for-each select="university/student">
                    <tr>
                        <!-- Highlight row if on probation -->
                        <xsl:if test="@status='on-probation'">
                            <xsl:attribute name="class">probation</xsl:attribute>
                        </xsl:if>

                        <td><xsl:value-of select="@id"/></td>
                        <td><xsl:value-of select="personal_details/name"/></td>
                        <td><xsl:value-of select="academic_info/department"/></td>
                        <td><xsl:value-of select="academic_info/score"/></td>
                        
                        <!-- Elaborate Conditional Logic -->
                        <td>
                            <xsl:choose>
                                <xsl:when test="academic_info/score &gt;= 40">
                                    <span class="pass">PASSED</span>
                                </xsl:when>
                                <xsl:otherwise>
                                    <span class="fail">FAILED</span>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        
                        <td><xsl:value-of select="performance/attendance"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>