<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        
        <html xmlns="http://www.w3.org/1999/xhtml">
            
            <head>
                <title>Auteur</title>
                <link rel="stylesheet" type="text/css" href="tp1.css"/>
            </head>
            <body>
                <h1>Informations associées à tous les auteurs</h1>
                
                <xsl:for-each select="//auteur">
                    <xsl:sort select="nom" />
                    <xsl:variable name="auteur_actuel" select="."/>
                    <div class="section-auteur">
                        <h2>
                            <xsl:value-of select="prenom"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="nom"/>
                        </h2>
                        <h4>
                            <xsl:if test="pays != ''">
                                <!-- Pays : --> 
                                <xsl:value-of select="pays"/><br/>
                            </xsl:if>
                        </h4>
                        <a>
                            <img>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="photo/@url"/>
                                </xsl:attribute>
                                <!-- <xsl:attribute name="id"><xsl:value-of select="@ident"/></xsl:attribute> -->
                                <xsl:attribute name="alt">
                                    <xsl:text>Photo de l'auteur </xsl:text>
                                    <xsl:value-of select="prenom"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="nom"/>
                                </xsl:attribute> 
                            </img>
                        </a>
                        <xsl:choose>
                            <xsl:when test="commentaire = '' or not(commentaire)">
                                <p>Aucun commentaire sur cet auteur est disponible.</p>
                            </xsl:when>
                            <xsl:otherwise>
                                <p>
                                    <xsl:value-of select="commentaire"/>
                                </p>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <div class="section-livre">
                        <h3>Ses oeuvres: </h3>
                        <xsl:for-each select="//livre">
                            <xsl:sort select="prix/valeur" data-type="number" order="descending"/>
                            <xsl:if test="contains(@auteur,$auteur_actuel/@ident)">
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
                            </xsl:if>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </body>
            <footer></footer>
        </html>
        
    </xsl:template>
</xsl:stylesheet>