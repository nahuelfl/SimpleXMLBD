<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Livres</title>
                <link rel="stylesheet" type="text/css" href="tp1.css"/>
            </head>
            <body>
                <h1>Informations associées aux livres</h1>
                <xsl:for-each select="//livre">
                    <xsl:variable name="livre_actuel" select="."/>
                    <div class="section-livre">
                        <a>
                            <xsl:if test="couverture/@url != ''">
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="couverture/@url"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:text>Couverture du livre</xsl:text>
                                        <xsl:value-of select="titre"/>
                                    </xsl:attribute>
                                </img>
                            </xsl:if>
                        </a>
                        <table>
                            <tr>
                                <th>Titre: </th>
                                <td>
                                    <xsl:value-of select="titre"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Auteur: </th>
                                <td>
                                    <xsl:for-each select="//auteur">
                                        <xsl:sort select="nom"/>
                                        <xsl:if test="contains($livre_actuel/@auteur,@ident)">
                                            <xsl:value-of select="nom"/>&#160;<xsl:value-of select="prenom"/><br/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </tr>
                            <tr>
                                <th>Année: </th>
                                <td>
                                    <xsl:value-of select="annee"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Langue: </th>
                                <td>
                                    <xsl:value-of select="@langue"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <xsl:text>Prix en (</xsl:text>
                                    <xsl:value-of select="prix/@devise"/>
                                    <xsl:text>):</xsl:text>
                                </th>
                                <td>
                                    <xsl:value-of select="prix/valeur"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Commentaire: </th>
                                <xsl:choose>
                                    <xsl:when test="commentaire = '' or not(commentaire)">
                                        <td>
                                            Aucun commentaire sur ce livre est disponible.
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td>
                                            <xsl:value-of select="commentaire"/>
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </tr>
                        </table>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>