<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.0.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="5" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="led-lumiled">
<description>&lt;b&gt;LEDs&lt;/b&gt; Please read the Description in Devices and Packages&lt;p&gt;
http://www.lumileds.com&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;&lt;br&gt;</description>
<packages>
<package name="LUMILED">
<description>&lt;b&gt;Lumileds Lighting. LUXEON®&lt;/b&gt; without cool pad&lt;p&gt;
Source: K2.pdf</description>
<wire x1="-3.575" y1="2.3375" x2="-2.3375" y2="3.575" width="0.2032" layer="21"/>
<wire x1="-2.3375" y1="3.575" x2="2.3375" y2="3.575" width="0.2032" layer="21"/>
<wire x1="3.575" y1="2.3375" x2="3.575" y2="-3.575" width="0.2032" layer="21"/>
<wire x1="3.575" y1="-3.575" x2="-2.3375" y2="-3.575" width="0.2032" layer="21"/>
<wire x1="-2.3375" y1="-3.575" x2="-2.5" y2="-3.4125" width="0.2032" layer="21"/>
<wire x1="-2.5" y1="-3.4125" x2="-3.4125" y2="-2.5" width="0.2032" layer="21" curve="167.43"/>
<wire x1="-3.4125" y1="-2.5" x2="-3.575" y2="-2.3375" width="0.2032" layer="21"/>
<wire x1="-3.575" y1="-2.3375" x2="-3.575" y2="2.3375" width="0.2032" layer="21"/>
<wire x1="2.3375" y1="3.575" x2="2.5" y2="3.4125" width="0.2032" layer="21"/>
<wire x1="2.5" y1="3.4125" x2="3.4125" y2="2.5" width="0.2032" layer="21" curve="167.43"/>
<wire x1="3.4125" y1="2.5" x2="3.575" y2="2.3375" width="0.2032" layer="21"/>
<wire x1="-1.725" y1="2.225" x2="-1.0625" y2="2.5625" width="0.2032" layer="21" curve="-255.45"/>
<wire x1="1.725" y1="-2.225" x2="1.0625" y2="-2.5625" width="0.2032" layer="21" curve="-255.45"/>
<circle x="0" y="0" radius="2.725" width="0.2032" layer="51"/>
<smd name="1NC" x="-5.2" y="1.15" dx="2.9" dy="1.7" layer="1"/>
<smd name="2+" x="-5.2" y="-1.15" dx="2.9" dy="1.7" layer="1"/>
<smd name="3NC" x="5.2" y="-1.15" dx="2.9" dy="1.7" layer="1" rot="R180"/>
<smd name="4-" x="5.2" y="1.15" dx="2.9" dy="1.7" layer="1" rot="R180"/>
<text x="-3.175" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-5.08" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-5.975" y1="0.575" x2="-3.625" y2="1.6" layer="51"/>
<rectangle x1="-5.975" y1="-1.6" x2="-3.625" y2="-0.575" layer="51"/>
<rectangle x1="3.625" y1="-1.6" x2="5.975" y2="-0.575" layer="51" rot="R180"/>
<rectangle x1="3.625" y1="0.575" x2="5.975" y2="1.6" layer="51" rot="R180"/>
<polygon width="0.4064" layer="29">
<vertex x="2.3383" y="1.35"/>
<vertex x="0" y="2.7"/>
<vertex x="-2.3383" y="1.35"/>
<vertex x="-2.3383" y="-1.35"/>
<vertex x="0" y="-2.7"/>
<vertex x="2.3383" y="-1.35"/>
</polygon>
<polygon width="0.4064" layer="31">
<vertex x="2.3383" y="1.35"/>
<vertex x="0" y="2.7"/>
<vertex x="-2.3383" y="1.35"/>
<vertex x="-2.3383" y="-1.35"/>
<vertex x="0" y="-2.7"/>
<vertex x="2.3383" y="-1.35"/>
</polygon>
</package>
<package name="LUMILED+">
<description>&lt;b&gt;Lumileds Lighting. LUXEON®&lt;/b&gt; with cool pad&lt;p&gt;
Source: K2.pdf</description>
<wire x1="-3.575" y1="2.3375" x2="-2.3375" y2="3.575" width="0.2032" layer="21"/>
<wire x1="-2.3375" y1="3.575" x2="2.3375" y2="3.575" width="0.2032" layer="21"/>
<wire x1="3.575" y1="2.3375" x2="3.575" y2="-3.575" width="0.2032" layer="21"/>
<wire x1="3.575" y1="-3.575" x2="-2.3375" y2="-3.575" width="0.2032" layer="21"/>
<wire x1="-2.3375" y1="-3.575" x2="-2.5" y2="-3.4125" width="0.2032" layer="21"/>
<wire x1="-2.5" y1="-3.4125" x2="-3.4125" y2="-2.5" width="0.2032" layer="21" curve="167.43"/>
<wire x1="-3.4125" y1="-2.5" x2="-3.575" y2="-2.3375" width="0.2032" layer="21"/>
<wire x1="-3.575" y1="-2.3375" x2="-3.575" y2="2.3375" width="0.2032" layer="21"/>
<wire x1="2.3375" y1="3.575" x2="2.5" y2="3.4125" width="0.2032" layer="21"/>
<wire x1="2.5" y1="3.4125" x2="3.4125" y2="2.5" width="0.2032" layer="21" curve="167.43"/>
<wire x1="3.4125" y1="2.5" x2="3.575" y2="2.3375" width="0.2032" layer="21"/>
<wire x1="-1.725" y1="2.225" x2="-1.0625" y2="2.5625" width="0.2032" layer="21" curve="-255.45"/>
<wire x1="1.725" y1="-2.225" x2="1.0625" y2="-2.5625" width="0.2032" layer="21" curve="-255.45"/>
<circle x="0" y="0" radius="2.725" width="0.2032" layer="51"/>
<smd name="1NC" x="-5.2" y="1.15" dx="2.9" dy="1.7" layer="1"/>
<smd name="2+" x="-5.2" y="-1.15" dx="2.9" dy="1.7" layer="1"/>
<smd name="3NC" x="5.2" y="-1.15" dx="2.9" dy="1.7" layer="1" rot="R180"/>
<smd name="4-" x="5.2" y="1.15" dx="2.9" dy="1.7" layer="1" rot="R180"/>
<text x="-3.175" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-5.08" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-5.975" y1="0.575" x2="-3.625" y2="1.6" layer="51"/>
<rectangle x1="-5.975" y1="-1.6" x2="-3.625" y2="-0.575" layer="51"/>
<rectangle x1="3.625" y1="-1.6" x2="5.975" y2="-0.575" layer="51" rot="R180"/>
<rectangle x1="3.625" y1="0.575" x2="5.975" y2="1.6" layer="51" rot="R180"/>
<polygon width="0.4064" layer="1">
<vertex x="2.3383" y="1.35"/>
<vertex x="0" y="2.7"/>
<vertex x="-2.3383" y="1.35"/>
<vertex x="-2.3383" y="-1.35"/>
<vertex x="0" y="-2.7"/>
<vertex x="2.3383" y="-1.35"/>
</polygon>
<polygon width="0.4064" layer="29">
<vertex x="2.3383" y="1.35"/>
<vertex x="0" y="2.7"/>
<vertex x="-2.3383" y="1.35"/>
<vertex x="-2.3383" y="-1.35"/>
<vertex x="0" y="-2.7"/>
<vertex x="2.3383" y="-1.35"/>
</polygon>
<polygon width="0.4064" layer="31">
<vertex x="2.3383" y="1.35"/>
<vertex x="0" y="2.7"/>
<vertex x="-2.3383" y="1.35"/>
<vertex x="-2.3383" y="-1.35"/>
<vertex x="0" y="-2.7"/>
<vertex x="2.3383" y="-1.35"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="LED">
<wire x1="1.27" y1="0" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="-2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.032" y1="-0.762" x2="-3.429" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="-3.302" y2="-3.302" width="0.1524" layer="94"/>
<text x="3.556" y="-4.572" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="5.715" y="-4.572" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="C" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="A" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="-3.429" y="-2.159"/>
<vertex x="-3.048" y="-1.27"/>
<vertex x="-2.54" y="-1.778"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.302" y="-3.302"/>
<vertex x="-2.921" y="-2.413"/>
<vertex x="-2.413" y="-2.921"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="LED" prefix="LED">
<description>&lt;b&gt;LED&lt;/b&gt;&lt;p&gt;
- &lt;u&gt;LUMILED®&lt;/u&gt;&lt;br&gt;
LXK2-PW12-R00, LXK2-PW12-S00, LXK2-PW14-U00, LXK2-PW14-V00&lt;br&gt;
LXK2-PM12-R00, LXK2-PM12-S00, LXK2-PM14-U00&lt;br&gt;
LXK2-PE12-Q00, LXK2-PE12-R00, LXK2-PE12-S00, LXK2-PE14-T00, LXK2-PE14-U00&lt;br&gt;
LXK2-PB12-K00, LXK2-PB12-L00, LXK2-PB12-M00, LXK2-PB14-N00, LXK2-PB14-P00, LXK2-PB14-Q00&lt;br&gt;
LXK2-PR12-L00, LXK2-PR12-M00, LXK2-PR14-Q00, LXK2-PR14-R00&lt;br&gt;
LXK2-PD12-Q00, LXK2-PD12-R00, LXK2-PD12-S00&lt;br&gt;
LXK2-PH12-R00, LXK2-PH12-S00&lt;br&gt;
LXK2-PL12-P00, LXK2-PL12-Q00, LXK2-PL12-R00&lt;br&gt;
&lt;p&gt;
Source: www.luxeon.com&lt;p&gt;</description>
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="LUMILED" package="LUMILED">
<connects>
<connect gate="G$1" pin="A" pad="2+"/>
<connect gate="G$1" pin="C" pad="4-"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="LUMILED+" package="LUMILED+">
<connects>
<connect gate="G$1" pin="A" pad="2+"/>
<connect gate="G$1" pin="C" pad="4-"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="diode">
<description>&lt;b&gt;Diodes&lt;/b&gt;&lt;p&gt;
Based on the following sources:
&lt;ul&gt;
&lt;li&gt;Motorola : www.onsemi.com
&lt;li&gt;Fairchild : www.fairchildsemi.com
&lt;li&gt;Philips : www.semiconductors.com
&lt;li&gt;Vishay : www.vishay.de
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DO41Z10">
<description>&lt;B&gt;DIODE&lt;/B&gt;&lt;p&gt;
diameter 2.54 mm, horizontal, grid 10.16 mm</description>
<wire x1="2.032" y1="-1.27" x2="-2.032" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-1.27" x2="2.032" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="1.27" x2="2.032" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="1.27" x2="-2.032" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0" x2="3.937" y2="0" width="0.762" layer="51"/>
<wire x1="-5.08" y1="0" x2="-4.064" y2="0" width="0.762" layer="51"/>
<wire x1="-0.635" y1="0" x2="0" y2="0" width="0.1524" layer="21"/>
<wire x1="1.016" y1="0.635" x2="1.016" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-0.635" x2="0" y2="0" width="0.1524" layer="21"/>
<wire x1="0" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0" y1="0" x2="1.016" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="0" width="0.1524" layer="21"/>
<pad name="C" x="-5.08" y="0" drill="1.1176"/>
<pad name="A" x="5.08" y="0" drill="1.1176"/>
<text x="-1.905" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-2.794" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.27" x2="-1.143" y2="1.27" layer="21"/>
<rectangle x1="2.032" y1="-0.381" x2="3.937" y2="0.381" layer="21"/>
<rectangle x1="-3.937" y1="-0.381" x2="-2.032" y2="0.381" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="ZD">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<text x="-1.778" y="1.905" size="1.778" layer="95">&gt;NAME</text>
<text x="-1.778" y="-3.429" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="1N4728" prefix="D">
<description>&lt;b&gt;Z DIODE&lt;/b&gt;&lt;p&gt;
3.3 V, 1W, 5 percent</description>
<gates>
<gate name="1" symbol="ZD" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DO41Z10">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="inductor-neosid">
<description>&lt;b&gt;Neosid Chokes and Transformers&lt;/b&gt;&lt;p&gt;

Based on the following sources:
&lt;ul&gt;
&lt;li&gt;Electronic Component Book, Part 2 : Chokes, Fixed Value Inductors
&lt;li&gt;Part 3 : Filters, Coil Assemblies, Thermoplastic Parts
&lt;li&gt;Part 4 : SMD Filters, Coils, Fixed Value Inductors
&lt;li&gt;www.neosid.de
&lt;/ul&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="71E">
<description>PRE-ADJUSTED &lt;b&gt;FILTER COIL&lt;/b&gt;&lt;p&gt;
1 winding, 2 pads, grid 2.5 x 7 mm</description>
<wire x1="-3.65" y1="-3.65" x2="-3.65" y2="-1.25" width="0.2032" layer="21"/>
<wire x1="-3.65" y1="1.25" x2="-3.65" y2="3.65" width="0.2032" layer="21"/>
<wire x1="-3.65" y1="3.65" x2="3.65" y2="3.65" width="0.2032" layer="21"/>
<wire x1="3.65" y1="-3.65" x2="-3.65" y2="-3.65" width="0.2032" layer="21"/>
<wire x1="-3.65" y1="-1.4" x2="-3.65" y2="1.4" width="0.2032" layer="51"/>
<wire x1="3.65" y1="1.4" x2="3.65" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="3.65" y1="-1.25" x2="3.65" y2="-3.65" width="0.2032" layer="21"/>
<wire x1="3.65" y1="3.65" x2="3.65" y2="1.25" width="0.2032" layer="21"/>
<pad name="E" x="-2.5" y="-2.5" drill="1.1"/>
<pad name="A" x="2.5" y="2.5" drill="1.1"/>
<pad name="S1" x="-3.75" y="0" drill="1.3"/>
<pad name="S2" x="3.75" y="0" drill="1.3"/>
<text x="-3.5" y="4.25" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.643" y="-5.326" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="SMF51-1">
<wire x1="0" y1="3.556" x2="0" y2="5.08" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="0" y1="2.032" x2="0" y2="3.556" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="0" y1="0.508" x2="0" y2="2.032" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="0" y1="-1.016" x2="0" y2="0.508" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="0" y1="-2.54" x2="0" y2="-1.016" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="4.572" x2="1.524" y2="3.81" width="0.1016" layer="94"/>
<wire x1="1.524" y1="3.048" x2="1.524" y2="2.286" width="0.1016" layer="94"/>
<wire x1="1.524" y1="1.524" x2="1.524" y2="0.762" width="0.1016" layer="94"/>
<wire x1="1.524" y1="0" x2="1.524" y2="-0.762" width="0.1016" layer="94"/>
<wire x1="1.524" y1="-1.524" x2="1.524" y2="-2.286" width="0.1016" layer="94"/>
<wire x1="-1.27" y1="-0.254" x2="2.54" y2="3.556" width="0.1524" layer="94"/>
<wire x1="2.032" y1="4.064" x2="2.54" y2="3.556" width="0.1524" layer="94"/>
<wire x1="2.54" y1="3.556" x2="3.048" y2="3.048" width="0.1524" layer="94"/>
<text x="-5.08" y="10.16" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="E" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="A" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" swaplevel="1"/>
</symbol>
<symbol name="SHIELD-2">
<wire x1="-5.08" y1="-10.16" x2="-4.318" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-10.16" x2="-5.08" y2="-9.398" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-8.636" x2="-5.08" y2="-8.128" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-7.112" x2="-5.08" y2="-6.604" width="0.254" layer="94"/>
<wire x1="-3.556" y1="-10.16" x2="-2.794" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-5.08" y1="2.032" x2="-4.318" y2="2.032" width="0.254" layer="94"/>
<wire x1="-3.556" y1="2.032" x2="-2.794" y2="2.032" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-6.096" x2="-5.08" y2="-5.588" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-4.572" x2="-5.08" y2="-4.064" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-3.556" x2="-5.08" y2="-3.048" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-2.032" x2="-5.08" y2="-1.524" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-1.016" x2="-5.08" y2="-0.508" width="0.254" layer="94"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="1.016" width="0.254" layer="94"/>
<wire x1="-5.08" y1="1.524" x2="-5.08" y2="2.032" width="0.254" layer="94"/>
<wire x1="5.08" y1="-10.16" x2="4.318" y2="-10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="-10.16" x2="5.08" y2="-9.398" width="0.254" layer="94"/>
<wire x1="5.08" y1="-8.636" x2="5.08" y2="-8.128" width="0.254" layer="94"/>
<wire x1="5.08" y1="-7.112" x2="5.08" y2="-6.604" width="0.254" layer="94"/>
<wire x1="3.556" y1="-10.16" x2="2.794" y2="-10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.032" x2="4.318" y2="2.032" width="0.254" layer="94"/>
<wire x1="3.556" y1="2.032" x2="2.794" y2="2.032" width="0.254" layer="94"/>
<wire x1="5.08" y1="-6.096" x2="5.08" y2="-5.588" width="0.254" layer="94"/>
<wire x1="5.08" y1="-4.572" x2="5.08" y2="-4.064" width="0.254" layer="94"/>
<wire x1="5.08" y1="-3.556" x2="5.08" y2="-3.048" width="0.254" layer="94"/>
<wire x1="5.08" y1="-2.032" x2="5.08" y2="-1.524" width="0.254" layer="94"/>
<wire x1="5.08" y1="-1.016" x2="5.08" y2="-0.508" width="0.254" layer="94"/>
<wire x1="5.08" y1="0.508" x2="5.08" y2="1.016" width="0.254" layer="94"/>
<wire x1="5.08" y1="1.524" x2="5.08" y2="2.032" width="0.254" layer="94"/>
<wire x1="-0.508" y1="-10.16" x2="-1.016" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-1.524" y1="-10.16" x2="-2.032" y2="-10.16" width="0.254" layer="94"/>
<wire x1="2.032" y1="-10.16" x2="1.524" y2="-10.16" width="0.254" layer="94"/>
<wire x1="1.016" y1="-10.16" x2="0.508" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-1.016" y1="2.032" x2="-0.254" y2="2.032" width="0.254" layer="94"/>
<wire x1="1.016" y1="2.032" x2="0.254" y2="2.032" width="0.254" layer="94"/>
<wire x1="1.524" y1="2.032" x2="2.286" y2="2.032" width="0.254" layer="94"/>
<wire x1="-1.524" y1="2.032" x2="-2.286" y2="2.032" width="0.254" layer="94"/>
<pin name="S1" x="-5.08" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S2" x="5.08" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="71E" prefix="L" uservalue="yes">
<description>&lt;b&gt;FILTER&lt;/b&gt;&lt;p&gt;
adjustable filter coil, Type E</description>
<gates>
<gate name="G$1" symbol="SMF51-1" x="0" y="0"/>
<gate name="G$2" symbol="SHIELD-2" x="0" y="5.08" addlevel="request"/>
</gates>
<devices>
<device name="" package="71E">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="E" pad="E"/>
<connect gate="G$2" pin="S1" pad="S1"/>
<connect gate="G$2" pin="S2" pad="S2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="LED1" library="led-lumiled" deviceset="LED" device="LUMILED"/>
<part name="LED2" library="led-lumiled" deviceset="LED" device="LUMILED"/>
<part name="LED3" library="led-lumiled" deviceset="LED" device="LUMILED"/>
<part name="D1" library="diode" deviceset="1N4728" device=""/>
<part name="D2" library="diode" deviceset="1N4728" device=""/>
<part name="D3" library="diode" deviceset="1N4728" device=""/>
<part name="D4" library="diode" deviceset="1N4728" device=""/>
<part name="L1" library="inductor-neosid" deviceset="71E" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="-50.8" y="30.48" size="1.778" layer="98">Bridge Rectifier</text>
<text x="-50.8" y="71.12" size="1.778" layer="98">LEDS</text>
<text x="-50.8" y="-10.16" size="1.778" layer="98">Coil Métalique</text>
</plain>
<instances>
<instance part="LED1" gate="G$1" x="-63.5" y="71.12" rot="R270"/>
<instance part="LED2" gate="G$1" x="-68.58" y="60.96" rot="R270"/>
<instance part="LED3" gate="G$1" x="-73.66" y="48.26" rot="R270"/>
<instance part="D1" gate="1" x="-71.12" y="27.94"/>
<instance part="D2" gate="1" x="-71.12" y="10.16"/>
<instance part="D3" gate="1" x="-58.42" y="20.32" rot="R90"/>
<instance part="D4" gate="1" x="-81.28" y="17.78" rot="R90"/>
<instance part="L1" gate="G$1" x="-71.12" y="-12.7" rot="R270"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="A"/>
<wire x1="-60.96" y1="71.12" x2="-58.42" y2="71.12" width="0.1524" layer="91"/>
<wire x1="-58.42" y1="71.12" x2="-58.42" y2="60.96" width="0.1524" layer="91"/>
<pinref part="D1" gate="1" pin="C"/>
<wire x1="-58.42" y1="60.96" x2="-58.42" y2="48.26" width="0.1524" layer="91"/>
<wire x1="-58.42" y1="48.26" x2="-58.42" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-68.58" y1="27.94" x2="-58.42" y2="27.94" width="0.1524" layer="91"/>
<pinref part="D3" gate="1" pin="C"/>
<wire x1="-58.42" y1="27.94" x2="-58.42" y2="22.86" width="0.1524" layer="91"/>
<junction x="-58.42" y="27.94"/>
<junction x="-58.42" y="48.26"/>
<junction x="-58.42" y="60.96"/>
<pinref part="LED2" gate="G$1" pin="A"/>
<wire x1="-58.42" y1="60.96" x2="-66.04" y2="60.96" width="0.1524" layer="91"/>
<pinref part="LED3" gate="G$1" pin="A"/>
<wire x1="-71.12" y1="48.26" x2="-58.42" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="D2" gate="1" pin="C"/>
<wire x1="-68.58" y1="10.16" x2="-58.42" y2="10.16" width="0.1524" layer="91"/>
<pinref part="D3" gate="1" pin="A"/>
<wire x1="-58.42" y1="10.16" x2="-58.42" y2="17.78" width="0.1524" layer="91"/>
<wire x1="-58.42" y1="10.16" x2="-58.42" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="L1" gate="G$1" pin="A"/>
<wire x1="-58.42" y1="-10.16" x2="-66.04" y2="-10.16" width="0.1524" layer="91"/>
<junction x="-58.42" y="10.16"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="D4" gate="1" pin="A"/>
<wire x1="-81.28" y1="15.24" x2="-81.28" y2="10.16" width="0.1524" layer="91"/>
<pinref part="D2" gate="1" pin="A"/>
<wire x1="-81.28" y1="10.16" x2="-73.66" y2="10.16" width="0.1524" layer="91"/>
<junction x="-81.28" y="10.16"/>
<wire x1="-81.28" y1="10.16" x2="-88.9" y2="10.16" width="0.1524" layer="91"/>
<wire x1="-88.9" y1="10.16" x2="-88.9" y2="48.26" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="C"/>
<wire x1="-88.9" y1="48.26" x2="-88.9" y2="60.96" width="0.1524" layer="91"/>
<wire x1="-73.66" y1="60.96" x2="-88.9" y2="60.96" width="0.1524" layer="91"/>
<pinref part="LED1" gate="G$1" pin="C"/>
<wire x1="-68.58" y1="71.12" x2="-88.9" y2="71.12" width="0.1524" layer="91"/>
<wire x1="-88.9" y1="71.12" x2="-88.9" y2="60.96" width="0.1524" layer="91"/>
<pinref part="LED3" gate="G$1" pin="C"/>
<wire x1="-88.9" y1="48.26" x2="-78.74" y2="48.26" width="0.1524" layer="91"/>
<junction x="-88.9" y="48.26"/>
<junction x="-88.9" y="60.96"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="D1" gate="1" pin="A"/>
<pinref part="D4" gate="1" pin="C"/>
<wire x1="-81.28" y1="20.32" x2="-81.28" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-81.28" y1="27.94" x2="-73.66" y2="27.94" width="0.1524" layer="91"/>
<pinref part="L1" gate="G$1" pin="E"/>
<wire x1="-73.66" y1="-10.16" x2="-86.36" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="-86.36" y1="-10.16" x2="-86.36" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-86.36" y1="27.94" x2="-81.28" y2="27.94" width="0.1524" layer="91"/>
<junction x="-81.28" y="27.94"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="113,1,-67.0645,-10.8331,L1,,,,,"/>
</errors>
</schematic>
</drawing>
</eagle>
