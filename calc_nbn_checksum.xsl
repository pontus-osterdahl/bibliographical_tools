<!-- 
 *
 * (c) Kitodo. Key to digital objects e. V. <contact@kitodo.org>
 *
 * This file is part of the Kitodo project.
 *
 * It is licensed under GNU General Public License version 3 or later.
 *
 * For the full copyright and license information, please read the
 * GPL3-License.txt file that was distributed with this source code.
 *


  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:mets="http://www.loc.gov/METS/" xmlns:kitodo="http://meta.kitodo.org/v1/"  xmlns:marc="http://www.loc.gov/MARC21/slim">
  <xsl:output method="xml" indent="yes" encoding="utf-8"/>
  <xsl:strip-space elements="*"/>

  <xsl:template name="calc_checksum">
    <xsl:param name="baseurn"/>
    <xsl:variable name="newURN">
      <xsl:call-template name="letters">
        <xsl:with-param name="earlyurn" select="$baseurn"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="fullSum">
      <xsl:call-template name="genSum">
        <xsl:with-param name="index" select="1"/>
        <xsl:with-param name="newURN_2" select="$newURN"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:message>
      <xsl:value-of select="$fullSum"/>
    </xsl:message>

    <xsl:variable name="lastNumber" select="substring($newURN,string-length($newURN))"/>
    <xsl:variable name="quot" select="number($fullSum) div number($lastNumber)"/>
    <xsl:message>
      <xsl:value-of select="$quot"></xsl:value-of>
    </xsl:message>
    <xsl:variable name="quotRound">
      <xsl:value-of select="floor($quot)"/>
    </xsl:variable>
    <xsl:message>
      <xsl:value-of select="$quotRound"></xsl:value-of>
    </xsl:message>
    <xsl:value-of select="substring($quotRound,string-length($quotRound))"/>
  </xsl:template>

  <xsl:template name="genSum">
    <xsl:param name="index" select ="0"/>
    <xsl:param name="newURN_2" select = "0"/>
    <xsl:message>
      <xsl:value-of select="$index"></xsl:value-of>
    </xsl:message>
    <xsl:variable name="posValue" select="substring($newURN_2,1,1)"/>
    <xsl:variable name="newSum" select="($index * number($posValue))"/>
    <xsl:variable name="newURN_3" select="substring($newURN_2,2)"/>
    <xsl:variable name="prevSum">
      <xsl:choose>
        <xsl:when test="$newURN_3 != ''">
          <xsl:call-template name="genSum">
            <xsl:with-param name="index" select="($index + 1)"/>
            <xsl:with-param name="newURN_2" select="$newURN_3"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="0"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="($prevSum + $newSum)"/>
  </xsl:template>

  <xsl:template name="letters">
    <xsl:param name="earlyurn"/>
    <xsl:if test="$earlyurn != ''">
      <xsl:variable name="char" select="substring($earlyurn,1,1)"/>
      <xsl:choose>
        <xsl:when test="$char = '9'">
          <xsl:text>41</xsl:text>
        </xsl:when>
        <xsl:when test="$char = '8'">
          <xsl:text>9</xsl:text>
        </xsl:when>
        <xsl:when test="$char = '7'">
          <xsl:text>8</xsl:text>
        </xsl:when>
        <xsl:when test="$char = '6'">
          <xsl:text>7</xsl:text>
        </xsl:when>
        <xsl:when test="$char = '5'">
          <xsl:text>6</xsl:text>
        </xsl:when>
        <xsl:when test="$char = '4'">
          <xsl:text>5</xsl:text>
        </xsl:when>
        <xsl:when test="$char = '3'">
          <xsl:text>4</xsl:text>
        </xsl:when>
        <xsl:when test="$char = '2'">
          <xsl:text>3</xsl:text>
        </xsl:when>
        <xsl:when test="$char = '1'">
          <xsl:text>2</xsl:text>
        </xsl:when>
        <xsl:when test="$char = '0'">
          <xsl:text>1</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'a'">
          <xsl:text>18</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'b'">
          <xsl:text>14</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'c'">
          <xsl:text>19</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'd'">
          <xsl:text>15</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'e'">
          <xsl:text>16</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'f'">
          <xsl:text>21</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'g'">
          <xsl:text>22</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'h'">
          <xsl:text>23</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'i'">
          <xsl:text>24</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'j'">
          <xsl:text>25</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'k'">
          <xsl:text>42</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'l'">
          <xsl:text>26</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'j'">
          <xsl:text>25</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'm'">
          <xsl:text>27</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'n'">
          <xsl:text>13</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'o'">
          <xsl:text>28</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'p'">
          <xsl:text>29</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'q'">
          <xsl:text>31</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'r'">
          <xsl:text>12</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 's'">
          <xsl:text>32</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 't'">
          <xsl:text>33</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'u'">
          <xsl:text>11</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'v'">
          <xsl:text>34</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'w'">
          <xsl:text>35</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'x'">
          <xsl:text>36</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'y'">
          <xsl:text>37</xsl:text>
        </xsl:when>
        <xsl:when test="$char = 'z'">
          <xsl:text>38</xsl:text>
        </xsl:when>
        <xsl:when test="$char = '-'">
          <xsl:text>39</xsl:text>
        </xsl:when>
        <xsl:when test="$char = ':'">
          <xsl:text>17</xsl:text>
        </xsl:when>
      </xsl:choose>
      <xsl:call-template name="letters">
        <xsl:with-param name="earlyurn" select="substring-after($earlyurn, $char)" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
