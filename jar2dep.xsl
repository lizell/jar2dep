<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
								xmlns="http://maven.apache.org/POM/4.0.0"
								xmlns:mvn="http://maven.apache.org/POM/4.0.0"
								xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								exclude-result-prefixes="mvn">
	<xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>
	<xsl:param name="scope"/>

	<xsl:template match="/">
		<xsl:if test="mvn:project">
			<xsl:element name="dependency" namespace="">
				<xsl:element name="groupId" namespace="">
					<xsl:value-of select="mvn:project/mvn:groupId | mvn:project/mvn:parent/mvn:groupId[not(/mvn:project/mvn:groupId)]"/>
				</xsl:element>
				<xsl:element name="artifactId" namespace="">
					<xsl:value-of select="mvn:project/mvn:artifactId"/>
				</xsl:element>
				<xsl:element name="version" namespace="">
					<xsl:value-of select="mvn:project/mvn:version | mvn:project/mvn:parent/mvn:version[not(/mvn:project/mvn:version)]"/>
				</xsl:element>
				<xsl:if test="$scope != ''">
					<xsl:element name="scope" namespace="">
						<xsl:value-of select="$scope"/>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
 	</xsl:template>
</xsl:stylesheet>
