var SVG_NS="http://www.w3.org/2000/svg";if(typeof(justep)=="undefined"){justep={}}justep.xq36={};justep.xq36.wd43=function(a){if(!a){return}for(var b in a){this[b]=a[b]}};justep.xq36.wd43.prototype={vx52:function(e,c){this.ks27=document.createElementNS(SVG_NS,e);var d=c.split(";");for(var b=0;b<d.length;b++){var a=d[b];if(a.indexOf(":")!=-1){a=a.split(":");this.ks27.setAttribute(a[0],a[1])}}this.parent.appendChild(this.ks27);this.ks27.sa37=this;this.jx53(this.shape);this.setText(this.text)},jx53:function(a){this.shape=a;this.ks27.setAttribute("width",a.w);this.ks27.setAttribute("height",a.h);this.ks27.setAttribute("x",a.x);this.ks27.setAttribute("y",a.y);this.ud62();return this},rc54:function(a){this.ks27.setAttribute("stroke",a.color);this.ks27.setAttribute("stroke-width",a.weight)},uk55:function(a){if(typeof a=="string"){this.ks27.setAttribute("fill",a);return}if(a.color!==undefined){this.ks27.setAttribute("fill",a.color)}if(a.opacity!==undefined){this.ks27.setAttribute("opacity",a.opacity)}return this},co56:function(){this.ks27.parentNode.appendChild(this.ks27);return this},vz57:function(){return this.shape},jo58:function(){if(this.ks27){return this.shape}},setText:function(a){this.text=a||"";this.text=this.text.replace(/@br@/gm,"");if(this.ks27){if(!this.ex34){this.textColor=this.textColor?this.textColor:"black";this.ex34=document.createElementNS(SVG_NS,"text");this.ex34.setAttribute("style","font-size:13px;fill: "+this.textColor+";");this.ex34.sa37=this.ks27.sa37;this.parent.appendChild(this.ex34)}while(this.ex34.firstChild){this.ex34.removeChild(this.ex34.firstChild)}if(a!=""){this.ex34.appendChild(document.createTextNode(this.text));this.ud62()}}},aq59:function(){return this.text.replace(/<br\/>/gm,"@br@")},rb60:function(b){var a=b?"":"none";this.ks27.style.display=a;if(this.ex34){this.ex34.style.display=a}},og61:function(a){this.textColor=a;if(this.ex34){this.ex34.setAttribute("style","fill: "+a+";")}},ud62:function(){if(this.ex34){var c=this.jo58();var d=this.lu63();var a=d.w;var b=d.h;this.ex34.setAttribute("x",(c.x+(c.w-a)/2));this.ex34.setAttribute("y",(c.y+(c.h)/2)+3)}},lu63:function(){var c=document.createElement("span");c.style.position="absolute";c.style.top="-100px";c.style.fontSize="13px";document.body.appendChild(c);c.innerHTML=this.text;var a=c.offsetWidth;var b=c.offsetHeight;document.body.removeChild(c);return{w:a,h:b}},sd64:function(){this.parent.removeChild(this.ks27);if(this.ex34){this.parent.removeChild(this.ex34)}}};justep.xq36.ot40=function(a){justep.xq36.wd43.call(this,a);this.vx52("rect","fill:#ffffff;stroke-width:1;stroke:#000000;");this.ks27.setAttribute("rx",5)};justep.xq36.ot40.prototype=new justep.xq36.wd43();justep.xq36.ty6=function(a){justep.xq36.wd43.call(this,a);this.vx52("polyline","fill:#ffffff;stroke-width:1;stroke:#000000;")};justep.xq36.ty6.prototype=new justep.xq36.wd43();justep.xq36.ty6.prototype.jx53=function(b){this.shape=b;var c=b.x;var a=b.x+b.w;var e=b.y;var d=b.y+b.h;this.ks27.setAttribute("points",[c,e,a,e,(a+c)/2,d,c,e].join(" "));this.ud62()};justep.xq36.ta24=function(a){justep.xq36.wd43.call(this,a);this.vx52("polyline","fill:#ffffff;stroke-width:1;stroke:#000000;")};justep.xq36.ta24.prototype=new justep.xq36.wd43();justep.xq36.ta24.prototype.jx53=function(b){this.shape=b;var c=b.x;var a=b.x+b.w;var e=b.y;var d=b.y+b.h;this.ks27.setAttribute("points",[c,(e+d)/2,(c+a)/2,e,a,(e+d)/2,(c+a)/2,d,c,(e+d)/2].join(" "));this.ud62()};justep.xq36.hv50=function(a){justep.xq36.wd43.call(this,a);this.vx52("circle","fill:#ffffff;stroke-width:1;stroke:#000000;")};justep.xq36.hv50.prototype=new justep.xq36.wd43();justep.xq36.hv50.prototype.jx53=function(a){this.shape=a;this.ks27.setAttribute("cx",a.x+a.w/2);this.ks27.setAttribute("cy",a.y+a.h/2);this.ks27.setAttribute("r",a.w<a.h?a.w/2:a.h/2);this.ud62()};justep.xq36.rc25=function(a){justep.xq36.wd43.call(this,a);this.vx52("polyline","fill:#ffffff;stroke-width:1;stroke:#000000;")};justep.xq36.rc25.prototype=new justep.xq36.wd43();justep.xq36.rc25.prototype.jx53=function(b){this.shape=b;var c=b.x;var a=b.x+b.w;var e=b.y;var d=b.y+b.h;this.ks27.setAttribute("points",[c,e,a,e,(a-b.w/4),d,(c+b.w/4),d,c,e].join(" "));this.ud62()};justep.xq36.kf19=function(b){justep.xq36.wd43.call(this,b);this.vx52("path","fill-opacity:0;stroke-width:1;stroke:#000000;");var a=this;setTimeout(function(){a.rc54({color:"blue"})},5)};justep.xq36.kf19.prototype=new justep.xq36.wd43();justep.xq36.kf19.prototype.jx53=function(e){this.shape=e;var m=["M"];for(var d=0,b=e.length;d<b;d++){var h=parseInt(e[d].x,10),f=parseInt(e[d].y,10);if(d==0){m.push(h+","+f)}else{m.push("L");m.push(h+","+f)}if(e[d].attach){var g=e[d].attach;var a=g.split(" ");for(var c=0;c<a.length/8;c++){m.push("L");m.push(parseInt(a[0+c*8].replace("L",""),10)+","+parseInt(a[1+c*8],10));m.push("C");m.push(parseInt(a[2+c*8].replace("C",""),10)+","+parseInt(a[3+c*8],10));m.push(parseInt(a[4+c*8],10)+","+parseInt(a[5+c*8],10));m.push(parseInt(a[6+c*8],10)+","+parseInt(a[7+c*8],10))}}}this.ks27.setAttribute("d",m.join(" "));this.wg66(this.endArrow);this.ud62();var k=this};justep.xq36.kf19.prototype.jo58=function(){var b=9999,g=9999,a=0,f=0;for(var e=0;e<this.shape.length;e++){var h=this.shape[e];b=Math.min(b,h.x);g=Math.min(g,h.y);a=Math.max(a,h.x);f=Math.max(f,h.y);if(h.attach){var c=h.attach.split(" ");for(var d=0;d<c.length;d++){var k=parseInt(c[d].replace("C",""));if(d%2==0){b=Math.min(b,k);a=Math.max(a,k)}else{g=Math.min(g,k);f=Math.max(f,k)}}}}return{x:b,y:g,w:a-b,h:f-g}};justep.xq36.kf19.prototype.ud62=function(){if(this.ex34){var c=this.shape[0].x;var g=this.shape[0].y;var b=this.shape[1].x;var e=this.shape[1].y;var d=this.lu63();var a=d.w;var f=d.h;this.ex34.setAttribute("x",(c+b-a)/2);this.ex34.setAttribute("y",(g+e)/2)}};justep.xq36.kf19.prototype.oi65=function(){if(!this.endArrow){var a=document.createElementNS(SVG_NS,"path");this.parent.appendChild(a);this.endArrow=a;this.wg66(a)}};justep.xq36.kf19.prototype.wg66=function(e){if(!e){return}var b=this.shape.length;var a=this.shape[b-1].x;var g=this.shape[b-1].y;var c=this.shape[b-2].x;var d=this.shape[b-2].y;var f=a==c?(d>g?"up":"down"):(c>a?"left":"right");if(f=="left"){e.setAttribute("d","M"+a+" "+g+" L"+(a+10)+" "+(g-3)+" L"+(a+10)+" "+(g+3)+" Z")}else{if(f=="right"){e.setAttribute("d","M"+a+" "+g+" L"+(a-10)+" "+(g-3)+" L"+(a-10)+" "+(g+3)+" Z")}else{if(f=="up"){e.setAttribute("d","M"+a+" "+g+" L"+(a-3)+" "+(g+10)+" L"+(a+3)+" "+(g+10)+" Z")}else{if(f=="down"){e.setAttribute("d","M"+a+" "+g+" L"+(a-3)+" "+(g-10)+" L"+(a+3)+" "+(g-10)+" Z")}}}}};justep.xq36.kf19.prototype.rc54=function(a){this.ks27.setAttribute("stroke",a.color);this.ks27.setAttribute("stroke-width",a.weight);if(this.endArrow){this.endArrow.setAttribute("fill",a.color);this.endArrow.setAttribute("stroke",a.color);this.endArrow.setAttribute("stroke-width",a.weight)}};justep.xq36.kf19.prototype.sd64=function(a){this.parent.removeChild(this.ks27);if(this.ex34){this.parent.removeChild(this.ex34)}if(this.endArrow){this.parent.removeChild(this.endArrow)}};var XLINK_NS="http://www.w3.org/1999/xlink";if(typeof(justep)=="undefined"){justep={}}justep.mb29={};justep.mb29.wd43=function(a){if(!a){return}for(var b in a){this[b]=a[b]}};justep.mb29.wd43.prototype={lb28:"Behavior: url(#default#VML);position:absolute;width:100;height:100;",gb67:function(f,c,d,b){var a=[];var h;if($.browser.version=="7.0"||$.browser.version=="6.0"){for(var g in b){a.push(g+"='"+b[g]+"'")}h=document.createElement("<"+c+" "+a.join(" ")+" style='"+d+"'></"+c+">")}else{h=document.createElement(c);if(d){h.style.cssText=d}if(b){for(var g in b){h.setAttribute(g,b[g])}}}if(f){f.appendChild(h)}return h},vx52:function(b,c,a){this.ks27=this.gb67(this.parent,b,c,a);this.ks27.sa37=this;this.jx53(this.shape);this.setText(this.text)},jx53:function(b){if(!b){return}this.shape=b;var a=$(this.ks27);a.css({top:b.y+"px",left:b.x+"px",width:b.w+"px",height:b.h+"px"});if(a.width()>0){a.width(b.w-(a.width()-b.w));a.height(b.h-(a.height()-b.h))}this.ud62()},oo68:function(){return{color:this.ks27.strokeColor,weight:this.ks27.StrokeWeight}},rc54:function(a){if($.browser.version=="9.0"){this.ks27.setAttribute("strokeColor",a.color)}this.ks27.strokeColor=a.color||"";this.ks27.StrokeWeight=a.weight||"1px";this.ks27.stroked=(a.weight==0||a.weight=="0")?"f":"t"},uk55:function(a){if(typeof(a)=="string"){this.ks27.fillcolor=a||"white"}else{this.ks27.fillcolor=a.color||"green";this.ks27.style.filter="alpha(opacity="+(a.opacity*100)||100+")"}},co56:function(){this.ks27.parentNode.appendChild(this.ks27);return this},vz57:function(){return this.shape},jo58:function(){if(this.ks27){var a=$(this.ks27);var b=a.position();return{x:b.left,y:b.top,w:a.outerWidth(),h:a.outerHeight()}}},setText:function(a){this.text=a||"";this.text=this.text.replace(/@br@/gm,"<br/>");if(this.ks27){if(!this.ex34){this.ex34=document.createElement("span");this.textColor=this.textColor?this.textColor:"black";$(this.ex34).css({cursor:"default",overflow:"auto",position:"absolute",font:"normal 12px 宋体, 'Arial Narrow', arial, serif",color:this.textColor});this.parent.appendChild(this.ex34);this.ex34.sa37=this.ks27.sa37}this.ex34.innerHTML=this.text;this.ud62()}},rb60:function(b){var a=b?"":"none";this.ks27.style.display=a;if(this.ex34){this.ex34.style.display=a}},aq59:function(){return this.text.replace(/<br\/>/gm,"@br@")},og61:function(a){this.textColor=a;if(this.ex34){$(this.ex34).css({color:a})}},ud62:function(){if(this.ex34){var c=this.vz57();var d=this.lu63();var a=d.w;var b=d.h;this.ex34.style.width=(a+1)+"px";this.ex34.style.left=(c.x+(c.w-a)/2)+"px";this.ex34.style.top=(c.y+(c.h-b)/2)+"px"}},lu63:function(){var c=document.createElement("span");c.style.position="absolute";c.style.top="-100px";c.style.font="normal 12px 宋体, 'Arial Narrow', arial, serif";document.body.appendChild(c);c.innerHTML=this.text;var a=c.offsetWidth;var b=c.offsetHeight;document.body.removeChild(c);return{w:a,h:b}},sd64:function(){if(this.ex34){this.ex34.sa37=null}this.parent.removeChild(this.ks27);if(this.ex34){this.parent.removeChild(this.ex34)}for(var a in this){this[a]=null}}};justep.mb29.ot40=function(a){justep.mb29.wd43.call(this,a);this.vx52("v:RoundRect",this.lb28)};justep.mb29.ot40.prototype=new justep.mb29.wd43();justep.mb29.ty6=function(a){justep.mb29.wd43.call(this,a);this.vx52("v:shape",this.lb28,{coordsize:"100 100",path:"m 0,0 l 100,0,50,100,0,0 x e"})};justep.mb29.ty6.prototype=new justep.mb29.wd43();justep.mb29.ta24=function(a){justep.mb29.wd43.call(this,a);this.vx52("v:shape",this.lb28,{coordsize:"100 100",path:"m 0,50 l 50,0,100,50,50,100,0,50 x e"})};justep.mb29.ta24.prototype=new justep.mb29.wd43();justep.mb29.hv50=function(a){justep.mb29.wd43.call(this,a);this.vx52("v:oval",this.lb28)};justep.mb29.hv50.prototype=new justep.mb29.wd43();justep.mb29.rc25=function(a){justep.mb29.wd43.call(this,a);this.vx52("v:shape",this.lb28,{coordsize:"100 100",path:"m 0,0 l 100,0,75,100,25,100,0,0 x e"})};justep.mb29.rc25.prototype=new justep.mb29.wd43();justep.mb29.kf19=function(a){justep.mb29.wd43.call(this,a);this.vx52("v:shape",this.lb28+";display:inline-block;width:1px;height:1px;",{filled:"false",path:"m 0,0,0,0 x e",coordsize:"1 1"});this.ik38=document.createElement("v:stroke");this.ik38.style.cssText="BEHAVIOR: url(#default#VML);DISPLAY: inline-block;";this.ks27.appendChild(this.ik38)};justep.mb29.kf19.prototype=new justep.mb29.wd43();justep.mb29.kf19.prototype.jx53=function(e){this.shape=e;var m=["M"];for(var d=0,b=e.length;d<b;d++){var h=parseInt(e[d].x,10),f=parseInt(e[d].y,10);if(d==0){m.push(h);m.push(f)}else{m.push("L");m.push(h);m.push(f)}if(e[d].attach){var g=e[d].attach;var a=g.split(" ");for(var c=0;c<a.length/8;c++){m.push("L");m.push(parseInt(a[0+c*8].replace("L",""),10)+","+parseInt(a[1+c*8],10));m.push("C");m.push(parseInt(a[2+c*8].replace("C",""),10)+","+parseInt(a[3+c*8],10));m.push(parseInt(a[4+c*8],10)+","+parseInt(a[5+c*8],10));m.push(parseInt(a[6+c*8],10)+","+parseInt(a[7+c*8],10))}}}if($.browser.version=="9.0"){var k=this;setTimeout(function(){k.ks27.path=m.join(" ");k.ud62()},1)}else{this.ks27.path=m.join(" ");this.ud62()}};justep.mb29.kf19.prototype.ud62=function(){if(this.ex34&&this.shape.length>1){var c=this.shape[0].x;var g=this.shape[0].y;var b=this.shape[1].x;var e=this.shape[1].y;var d=this.lu63();var a=d.w;var f=d.h;this.ex34.style.left=(c+b-a)/2+"px";this.ex34.style.top=(g+e-f)/2+"px"}};justep.mb29.kf19.prototype.oi65=function(){if(!this.endArrow){this.ik38.setAttribute("EndArrow","Classic");this.ik38.EndArrow="Classic";this.endArrow=true}};justep.mb29.kf19.prototype.vp69=function(){if(!this.StartArrow){this.ik38.setAttribute("StartArrow","Classic");this.ik38.StartArrow="Classic";this.startArrow=true}};justep.mb29.kf19.prototype.ge70=function(){if(this.endArrow){this.ik38.setAttribute("EndArrow",undefined);this.ik38.EndArrow=undefined;this.endArrow=false}};justep.mb29.kf19.prototype.ek71=function(){if(this.startArrow){this.ik38.setAttribute("StartArrow",undefined);this.ik38.StartArrow=undefined;this.startArrow=false}};if(typeof(justep.graphics)=="undefined"){justep.graphics={}}justep.graphics.ProcessPertCanvas=function(a){this.id=a.id;this.figureType=($.browser.msie&&(!document.documentMode||document.documentMode<10))?"mb29":"xq36";this.hw11={};this.lines={};this.onClick=a.onClick;this.lg72()};justep.graphics.ProcessPertCanvas.prototype={lg72:function(){this.if18=document.getElementById(this.id);if(this.figureType=="mb29"){document.namespaces.add("v","urn:schemas-microsoft-com:vml");this.nc30=document.createElement("v:group");this.nc30.style.cssText="WIDTH: 400px; HEIGHT: 300px;POSITION: absolute";this.nc30.setAttribute("coordsize","100,100");this.divContainer=this.nc30;this.if18.appendChild(this.nc30)}else{this.divContainer=this.if18;this.divContainer.style.overflow="hidden";var a=document.createElementNS("http://www.w3.org/2000/svg","svg");a.setAttribute("version","1.1%");this.nc30=a;this.divContainer.appendChild(this.nc30)}this.zc73()},zc73:function(){var a=this;this.if18.onmousedown=function(e){if(a.onClick){var g=null;var f=null;var e=window.event||e;var c=e.srcElement||e.target;while(!!c){if(c.getAttribute("id")==a.id){break}if(c.getAttribute("isBotItem")=="true"){g=c.getAttribute("bot");f=c.getAttribute("executor");break}else{c=c.parentNode}}if(!!g){var b=a.gu77(g);if(!!b){var d=__prepareBotData(b,f);a.onClick(d)}}}}},dt74:function(){for(var a in this.hw11){this.hw11[a].sd64()}for(var a in this.lines){this.lines[a].sd64()}this.hw11={};this.lines={}},loadData:function(k){this.dt74();if(!k||k==""){return}this.modelData=k;this._deep=0;this._deepMaxTops=[];if(k.length>0){this.qa75(k[0],20,20)}for(var c in this.hw11){var g=this.hw11[c];var e=g.data;if(e){var j=e.ahead;if(j){var l=-1;for(var f=0;f<j.length;f++){var h=this.hw11[j[f]];if(h){l=Math.max(l,h.deep)}}g.deep=l+1;g.ah81(20+g.deep*290)}}}for(var b in this.hw11){var e=this.gu77(b);var g=this.hw11[b];if(e.next){for(var f=0;f<e.next.length;f++){var d=this.hw11[e.next[f]];this.bg76(g,d)}}}this.zk78()},qa75:function(e,a,f){if(this.hw11[e.id]){return}var d=0;for(var c=this._deep;c<this._deepMaxTops.length;c++){d=Math.max(d,this._deepMaxTops[c])}if(f<=d){f=d+200}var b={parent:this.divContainer,data:e,shape:{x:a,y:f,w:260,h:100},deep:this._deep};this.hw11[e.id]=new justep.graphics.PertRectangle(b);this._deepMaxTops[this._deep]=f;a+=290;if(e.next){this._deep++;for(var c=0;c<e.next.length;c++){this.qa75(this.gu77(e.next[c]),a,f);f+=200}this._deep--}},bg76:function(e,c){var k=e.shape;var h=c.shape;var b=k.x+k.w;var g=k.y+k.h/2;var a=h.x;var f=h.y+h.h/2;var d={parent:this.nc30,shape:[{x:b,y:g},{x:a-18,y:g},{x:a-18,y:f},{x:a,y:f}]};var j=new justep[this.figureType]["kf19"](d);j.oi65();this.lines[e.data.id+"_"+c.data.id]=j},gu77:function(a){for(i in this.modelData){if(this.modelData[i].id==a){return this.modelData[i]}}},zk78:function(){var a=this.ii79();$(this.if18.parentNode).css({width:a.right+24,height:a.bottom+24});$(this.divContainer).css({width:a.right+20,height:a.bottom+20});$(this.nc30).css({width:a.right+16,height:a.bottom+16})},ii79:function(){var g=10000,f=10000,c=0,d=0;for(var e in this.hw11){var a=this.hw11[e];var b=a.vz57();if(b.x){g=Math.min(g,b.x);f=Math.min(f,b.y);d=Math.max(d,b.x+b.w);c=Math.max(c,b.y+b.h)}}return{left:g,top:f,right:d,bottom:c}},sd64:function(){this.parent.removeChild(this.element)}};justep.graphics.PertRectangle=function(a){this.shape=a.shape;this.parent=a.parent;this.data=a.data;this.deep=a.deep;this.ly80()};justep.graphics.PertRectangle.prototype={ly80:function(){this.element=document.createElement("div");$(this.element).css({top:this.shape.y,left:this.shape.x,width:this.shape.w,position:"absolute",background:"#ddeeff",display:"inline"});this.parent.appendChild(this.element);var F=this.data.name||"";var c=this.data.executor||"";var n=this.data.executordepartment||"";var u=this.data.status||"";var g=this.data.createtime||"";var h=this.data.executetime||"";var y=' style="padding: 1px 4px 1px 4px;border-bottom:1px solid black;font:bold 10pt;height:20px;width:75px"';var B=' style="border-bottom:1px solid black;font:10pt;height:15px"';var z=' style="padding: 1px 4px 1px 4px;font:bold 10pt;height:20px"';var x=' style="font: 10pt;"';if(typeof c=="string"){c=n+"/"+c;var r=new justep.Message(justep.Message.JUSTEP230050);var q=new justep.Message(justep.Message.JUSTEP230051);var A=new justep.Message(justep.Message.JUSTEP230052);var e=new justep.Message(justep.Message.JUSTEP230053);var s=new justep.Message(justep.Message.JUSTEP230054);this.element.innerHTML='<table width="100%" isBotItem="true" bot="'+this.data.id+'" executor="'+this.data.id+'" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed"><tr><td'+y+">"+r.getMessage()+":</td><td"+B+">"+F+"</td></tr><tr><td"+z+">"+A.getMessage()+":</td><td"+x+">"+c+"</td></tr><tr><td"+z+">"+q.getMessage()+":</td><td"+x+">"+u+"</td></tr><tr><td"+z+">"+e.getMessage()+":</td><td"+x+">"+formatDate(g)+"</td></tr><tr><td"+z+">"+s.getMessage()+":</td><td"+x+">"+formatDate(h)+"</td></tr></table>";this.table=this.element.lastChild;var m=this.table.rows;for(var w=0,t=m.length;w<t;w++){m[w].cells[0].figure=this;m[w].cells[1].figure=this}for(var w=0,t=m.length;w<t;w++){var b=m[w].cells[1];this.rg82(b)}}else{var F=this.data.name||"";var c=this.data.executor||"";var n=this.data.executordepartment||"";var u=this.data.status||"";var g=this.data.createtime||"";var h=this.data.executetime||"";var o;z=' style="padding: 1px 4px 1px 4px;font:bold 10pt;height:20px;width:75px"';var r=new justep.Message(justep.Message.JUSTEP230050);var q=new justep.Message(justep.Message.JUSTEP230051);var A=new justep.Message(justep.Message.JUSTEP230052);var e=new justep.Message(justep.Message.JUSTEP230053);var s=new justep.Message(justep.Message.JUSTEP230054);for(var w=0;w<c.length;w++){var k=c[w];var a=k.executor||"";var n=k.executordepartment||"";var u=k.status||"";var g=(k.createtime||"");var h=(k.executetime||"");if(h!=""){h="<tr><td"+z+">"+s.getMessage()+":</td><td"+x+">"+formatDate(h)+"</td></tr>"}var p=' style="border-bottom:1px solid black;font:10pt;height:0px"';var D='<tr height="5"><td'+y+"></td><td"+p+"></td></tr>";if(!o){D="<tr><td"+y+">"+r.getMessage()+":</td><td"+B+">"+F+"</td></tr>"}o=true;a=n+"/"+a;var d=[];if(k.ext!=undefined&&k.ext!=null){d=k.ext}var f="";for(var v=0;v<d.length;v++){var E=d[v];f+="<tr><td"+z+">"+E.label+":</td><td"+x+">"+E.value+"</td></tr>"}this.element.innerHTML+='<table width="100%" isBotItem="true" bot="'+this.data.id+'" executor="'+k.id+'" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed">'+D+"<tr><td"+z+">"+A.getMessage()+":</td><td"+x+">"+a+"</td></tr><tr><td"+z+">"+q.getMessage()+":</td><td"+x+">"+u+"</td></tr><tr><td"+z+">"+e.getMessage()+":</td><td"+x+">"+formatDate(g)+"</td></tr>"+h+f+"</table>"}for(var w=0;w<this.element.children.length;w++){var C=this.element.children[w];var m=C.rows;for(var v=0,t=m.length;v<t;v++){m[v].cells[0].figure=this;m[v].cells[1].figure=this}for(var v=0,t=m.length;v<t;v++){var b=m[v].cells[1];this.rg82(b)}}}},ah81:function(a){this.shape.x=a;$(this.element).css({left:a})},vz57:function(){return this.shape},rg82:function(c){return;var b=c.innerHTML;var d=b.replace(/[^\x00-\xff]/g,"rr").length/20;if(d>1){var a=d*9;this.gc83(c,a);this.gc83(this.element,a)}},gc83:function(c,a){var d=c.style.height;if(!d||d==""){d=20}else{d=d.substring(0,d.length-2)}var b=parseInt(d)+parseInt(a);this.bound.h=b;c.style.height=b},fy84:function(b){this.tempDiv=document.createElement("span");this.canvas.container.appendChild(this.tempDiv);this.tempDiv.innerHTML=b;this.canvas.container.removeChild(this.tempDiv);var a=this.tempDiv.offsetWidth/194;return Math.ceil(a)},sd64:function(){this.parent.removeChild(this.element)}};function formatDate(a){if(a==undefined||a==""){return""}a=a.replace("T"," ");a=a.substring(0,a.indexOf("."));return a}function __wfLoadBot(id,g_data,onClick){if(document.getElementById(id)){if(!JustepFlowTrack[id]){JustepFlowTrack[id]=new justep.graphics.ProcessPertCanvas({id:id,onClick:onClick})}g_data=g_data.replace(new RegExp("\n","gm"),"");var jsondata=eval("("+g_data+")");if(jsondata==null){jsondata={}}JustepFlowTrack[id].loadData(jsondata.botChart)}}if(typeof(justep.graphics)=="undefined"){justep.graphics={}}justep.graphics.ProcessRuntimeCanvas=function(a){this.id=a.id;this.figureType=($.browser.msie&&(!document.documentMode||document.documentMode<10))?"mb29":"xq36";this.hw11={};this.lines={};this.onClick=a.onClick;this.lg72()};justep.graphics.ProcessRuntimeCanvas.prototype={lg72:function(){this.if18=document.getElementById(this.id);if(this.figureType=="mb29"){document.namespaces.add("v","urn:schemas-microsoft-com:vml");this.nc30=document.createElement("v:group");this.nc30.style.cssText="WIDTH: 100px; POSITION: absolute; HEIGHT: 100px;";this.nc30.setAttribute("coordsize","100,100");this.if18.appendChild(this.nc30)}else{var a=document.createElementNS("http://www.w3.org/2000/svg","svg");a.setAttribute("width",100);a.setAttribute("height",100);a.setAttribute("version","1.1%");this.nc30=a;this.if18.appendChild(a)}this.zc73()},zc73:function(){var a=this;this.if18.onmousemove=function(c){var c=window.event||c;var h=c.srcElement||c.target;var j=h.sa37;if(j&&!$.browser.msie&&j.type=="connection"){var l=c.clientX,k=c.clientY-90;for(var d in a.hw11){var b=a.hw11[d];var g=b.vz57();if(b.type=="businessActivity"&&l>g.x&&l<(g.x+g.w)&&k>g.y&&l<(g.y+g.h)){j=b;break}}}if(j&&j.type=="businessActivity"){if(!a.showTips){var f=a.modelData.processMainData[j.id].name;var m=a.ca85(f);if(m){var e={parent:document.body,data:m,shape:{x:c.x||c.pageX,y:c.y||c.pageY,w:260,h:100}};a.showTips=new justep.graphics.PertRectangle(e)}}}else{if(a.showTips){a.showTips.sd64();a.showTips=null}}};this.if18.onmousedown=function(c){var c=window.event||c;var h=c.srcElement||c.target;var j=h.sa37;if(j&&!$.browser.msie&&j.type=="connection"){var l=c.clientX,k=c.clientY-90;for(var d in a.hw11){var b=a.hw11[d];var g=b.vz57();if(b.type=="businessActivity"&&l>g.x&&l<(g.x+g.w)&&k>g.y&&l<(g.y+g.h)){j=b;break}}}if(j&&j.type=="businessActivity"){if(a.onClick){var f=a.modelData.processMainData[j.id].name;var e=a.modelData.processMainData[j.id].LABEL;var m=a.ca85(f);var n={process:justep.Context.getCurrentProcess(),processName:justep.Context.getCurrentProcessLabel(),activity:f,activityName:e,bot:__prepareBotData(a.ca85(f))};a.onClick(n)}}}},ca85:function(c){if(!this.bot){return null}var d=null;for(var b=this.bot.length-1;b>=0;b--){var a=this.bot[b];if(a.activity&&c==getSymbolName(a.activity)){if(a.status=="尚未处理"){return a}else{d=a}}}return d},zk78:function(){var a=this.ii79();this.nc30.style.width=(a.right+23)+"px";this.nc30.style.height=(a.bottom+3)+"px"},if86:function(b){var d={businessActivity:"ot40",conditionActivity:"ty6",connection:"kf19",conditionBranch:"ta24",and:"hv50",xor:"hv50",start:"hv50",end:"hv50",autoActivity:"rc25"};var c=b.type;if(!b.id){b.id=c+new Date().getTime()}$.extend(b,{isProcessShape:true,parent:this.nc30});var a=new justep[this.figureType][d[c]](b);if(c=="start"){this.start=a}else{if(c=="end"){this.end=a}else{if(c=="connection"){a.oi65();this.lines[a.id]=a}}}this.hw11[a.id]=a;return a},dt74:function(){for(var a in this.hw11){this.hw11[a].sd64()}this.hw11={};this.lines={}},loadData:function(e){this.dt74();if(!e||e==""){return}this.modelData=e.gMeta;this.bot=e.botChart;var a=this.modelData.processMainData||{};this.yu26={};for(var g in a){var e=a[g];var b=e.style;if(b&&e.type!="connection"){if(b.bound){b.shape=b.bound;b.bound=null;delete b.bound}else{if(this.figureType=="xq36"){b.shape.w=b.shape.w-4;b.shape.h=b.shape.h-4}}b.type=e.type;b.id=g;var c=e.LABEL;var h=b.LABEL;if(h&&h.replace(/@br@/,"")==c){b.text=h}else{b.text=c}this.if86(b)}else{if(e.type=="connection"){this.yu26[g]=e}}}for(var g in this.yu26){var e=this.yu26[g];var d=this.hw11[e.sourceNode];var f=this.hw11[e.targetNode];if(!d||!f){continue}var b=e.style;if(b.points){b.shape=b.points;b.points=null;delete b.points}b.type=e.type;b.id=g;b.text=e.text||e.LABEL||(e.style?e.style.LABEL:"");this.if86(b)}this.zk78()},mt87:function(a){if(a){this.flowOutColor="green";this.backFlowColor="red";this.abortActivityColor="#ff6666";this.livingActivityColor="#0080FF";this.pausedActivityColor="yellow";this.qh88(a.finisheds);this.nz91(a.flowTrack,this.flowOutColor);this.sl89(a.suspends);this.it90(a.aborts);this.do96(a.backTrack,this.backFlowColor);this.mk97(a.livings);this.ni98(a.lasts,this.flowOutColor)}},qh88:function(d){this.finishedActivity=[];if(d){for(var b=0;b<d.length;b++){var c=d[b];var a=this.za101(c);if(a){this.ur100(a,this.flowOutColor);this.finishedActivity.push(a)}}}if(this.finishedActivity.length!=0){this.sm99(this.finishedActivity)}},sl89:function(d){this.pausedActivities=[];if(d){for(var b=0;b<d.length;b++){var c=d[b];var a=this.za101(c);if(a){this.ur100(a,this.pausedActivityColor);this.pausedActivities.push(a)}}}if(this.pausedActivities.length!=0){this.sm99(this.pausedActivities)}},it90:function(d){this.abortActivities=[];if(d){for(var b=0;b<d.length;b++){var c=d[b];var a=this.za101(c);if(a){this.ur100(a,this.abortActivityColor);this.abortActivities.push(a)}}}if(this.abortActivities.length!=0){this.sm99(this.abortActivities)}},nz91:function(g,c){var h=this.lines;for(var d in h){var j=h[d];var b=j.sourceNode;var f=j.targetNode;if($.inArray(b,g)!=-1&&$.inArray(f,g)!=-1){this.ur100(j,c);var a=this.za101(b);var e=this.za101(f);this.ur100(a,c);this.ur100(e,c)}}this.highlightedConnections=[]},oc92:function(h,e){if((!h)||(!h[0])||(!h[1])){return false}var a=h[0];var g=h[1];var b=[];var c=[];var d=false;this.pw93(this.lines,a,g,b,c);for(var f=0;f<b.length;f++){var j=b[f];this.ur100(j,e);this.ur100(this.za101(j.sourceNode),e);j.co56();d=true}if(d){this.highlightedConnections.push(h);return true}else{return false}},pw93:function(j,a,g,c,b){if(!b){b=[]}for(var e in j){var k=j[e];if(this.gb95(b,k)){continue}var d=k.sourceNode;var f=k.targetNode;if(d==a){c.push(k);b.push(k);if(f==g){return true}else{if(this.za101(f).type=="businessActivity"){c.pop()}else{var h=this.pw93(j,f,g,c,b);if(!h){c.pop()}else{return true}}}}}},uv94:function(a){if(this.gb95(this.livingActivities,a)||this.gb95(this.abortActivities,a)||this.gb95(this.pausedActivities,a)){return true}return false},gb95:function(d,b){if(!d){return false}for(var a=0;a<d.length;a++){var c=d[a];if(c==b){return c}}},do96:function(c,e){if(c){for(var g in c){var d=c[g];var a=this.za101(d[0]);var j=this.za101(d[1]);if(a&&j){var f=a.vz57();var k=j.vz57();var b=Math.max(f.x+f.w,k.x+k.w)+20;var h=[{},{},{},{}];h[0].x=f.x+f.w;h[0].y=f.y+f.h/2;h[1].x=b;h[1].y=h[0].y;h[2].x=b;h[2].y=k.y+k.h/2;h[3].x=k.x+k.w;h[3].y=k.y+f.h/2;var l=new justep[this.figureType]["kf19"]({parent:this.nc30,shape:h});l.oi65();this.hw11["back"+new Date().getTime()]=l;this.ur100(l,e);this.ur100(a,e)}}}},mk97:function(d){this.livingActivities=[];if(d){for(var b=0;b<d.length;b++){var c=d[b];var a=this.za101(c);if(a){this.ur100(a,this.livingActivityColor);this.livingActivities.push(a)}}}if(this.livingActivities.length!=0){this.sm99(this.livingActivities)}},ni98:function(c,a){if(this.livingActivities.length==0&&this.abortActivities.length==0){if(c&&c.length!=0){var d=true;for(var b=0;b<c.length;b++){if(!this.uv94(this.za101(c[b]))){d=this.oc92([c[b],this.modelData.processMainData[this.end.id].name],a)}else{d=false}}if(d){this.ur100(this.end,a)}}}},sm99:function(f){if(f){for(var d=0,c=f.length;d<c;d++){var e=f[d];var b=this.lines;for(var g in b){var a=b[g];if(this.modelData.processMainData[this.start.id].name==a.sourceNode&&this.modelData.processMainData[e.id].name==a.targetNode){this.ur100(this.start,this.flowOutColor);this.ur100(a,this.flowOutColor);break}}}}},ur100:function(a,b){a.uk55(b);a.rc54({color:b});if(a.type!="connection"){}},za101:function(b){b=getSymbolName(b);if(!this.modelData){return}var a=this.modelData.processMainData;for(var c in a){if(a[c].name==b){return this.hw11[c]}}},ii79:function(){var d=10000,h=10000,a=0,j=0;for(var c in this.hw11){var b=this.hw11[c];var g=b.vz57();if(g.x){d=Math.min(d,g.x);h=Math.min(h,g.y);j=Math.max(j,g.x+g.w);a=Math.max(a,g.y+g.h)}else{for(var f=0,e=g.length;f<e;f++){d=Math.min(d,g[f].x);h=Math.min(h,g[f].y);j=Math.max(j,g[f].x);a=Math.max(a,g[f].y)}}}return{left:d,top:h,right:j,bottom:a}}};typeof JustepFlowTrack=="undefined"?JustepFlowTrack={}:JustepFlowTrack;function __wfLoadTrack(id,g_data,onClick){if(document.getElementById(id)){if(!JustepFlowTrack[id]){JustepFlowTrack[id]=new justep.graphics.ProcessRuntimeCanvas({id:id,onClick:onClick})}g_data=g_data.replace(new RegExp("\n","gm"),"");var jsondata=eval("("+g_data+")");JustepFlowTrack[id].loadData(jsondata);JustepFlowTrack[id].mt87(jsondata.otherMeta)}}function getSymbolName(a){if(!a){return""}a=a+"";if(a.indexOf(".")==-1){a=a.match(/[^\/]+$/)}else{a=a.match(/[^\/]+(?=\.)/)}return a}function createActionStringAndExecuteActionGetFlowTrack(business_data,process,process_instance,task,ext){var doc="";var param="";var action="";if((ext==undefined)||(ext==null)){ext=""}if(process_instance&&process_instance!=""){action="getProcessChartByPIAction";param='<parameters><parameter name="pi"><xbiz:simple xmlns:xbiz="http://www.justep.com/xbiz#" type="http://www.w3.org/2001/XMLSchema#string">'+process_instance+'</xbiz:simple></parameter><parameter name="ext"><xbiz:simple xmlns:xbiz="http://www.justep.com/xbiz#" type="http://www.w3.org/2001/XMLSchema#string">'+ext+"</xbiz:simple></parameter></parameters>"}else{if(task&&task!=""){action="getProcessChartByTaskAction";param='<parameters><parameter name="task"><xbiz:simple xmlns:xbiz="http://www.justep.com/xbiz#" type="http://www.w3.org/2001/XMLSchema#string">'+task+'</xbiz:simple></parameter><parameter name="ext"><xbiz:simple xmlns:xbiz="http://www.justep.com/xbiz#" type="http://www.w3.org/2001/XMLSchema#string">'+ext+"</xbiz:simple></parameter></parameters>"}else{if(!business_data||business_data==""){business_data="null-sdata"}if(!process||process==""){process="null-process"}action="getProcessChartByDataAction";param='<parameters><parameter name="process"><xbiz:simple xmlns:xbiz="http://www.justep.com/xbiz#" type="http://www.w3.org/2001/XMLSchema#string">'+process+'</xbiz:simple></parameter><parameter name="data"><xbiz:simple xmlns:xbiz="http://www.justep.com/xbiz#" type="http://www.w3.org/2001/XMLSchema#string">'+business_data+'</xbiz:simple></parameter><parameter name="ext"><xbiz:simple xmlns:xbiz="http://www.justep.com/xbiz#" type="http://www.w3.org/2001/XMLSchema#string">'+ext+"</xbiz:simple></parameter></parameters>"}}var response=justep.Request.sendBizRequest("/SA/OPM/system/systemProcess","mainActivity",action,param,null,null,true);var result="{}";if(justep.Request.isBizSuccess(response)){var responseXML=response.responseXML;var resultNode=justep.XML.eval(responseXML,"/root/data/*","single");var tmp="";if(navigator.userAgent.indexOf("Firefox")>0){var textBuf=[];var nodes=resultNode.childNodes;for(var i=0;i<1;i++){if(nodes[i].nodeType==3||nodes[i].nodeType==4){textBuf.push(nodes[i].wholeText)}}tmp=textBuf.join("")}else{tmp=justep.XML.getNodeText(resultNode)}if(justep.String.trim(tmp)!=""){result=tmp}}return result}function __prepareBotData(e,d){var a=null;if(!!e){a={task:{id:e.id,sName:e.name,sStatusID:e.statusID,sStatusName:e.status,sCreateTime:e.createtime,sActualFinishTime:e.executetime,sCreatorFID:e.creatorFID,sCreatorFName:e.creatorFName,sProcess:e.process,sProcessName:e.processName,sActivity:e.activity,sActivityName:e.activityName,sRefActivity:e.refActivity},executors:[],curExecutor:null};if(e.executor&&e.executor.length>0){for(var b=0;b<e.executor.length;b++){var c={id:e.executor[b].id,sName:e.executor[b].name,sExecutorFID:e.executor[b].executorFID,sExecutorFName:e.executor[b].executorFName,sCURL:e.executor[b].curl,sEURL:e.executor[b].eurl,sStatusID:e.executor[b].statusID,sStatusName:e.executor[b].status,sCreateTime:e.executor[b].createtime,sActualFinishTime:e.executor[b].executetime,ext:e.executor[b].exts};if(!!d&&(e.executor[b].id==d)){a.curExecutor=c}a.executors[a.executors.length]=c}}}return a};