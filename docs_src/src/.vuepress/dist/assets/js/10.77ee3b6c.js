(window.webpackJsonp=window.webpackJsonp||[]).push([[10],{387:function(t,a,e){"use strict";e.r(a);var r=e(51),s=Object(r.a)({},(function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("ContentSlotsDistributor",{attrs:{"slot-key":t.$parent.slotKey}},[e("h1",{attrs:{id:"airflow-ui"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#airflow-ui"}},[t._v("#")]),t._v(" Airflow UI")]),t._v(" "),e("h2",{attrs:{id:"make-the-ui-accessible-locally"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#make-the-ui-accessible-locally"}},[t._v("#")]),t._v(" Make the UI accessible locally")]),t._v(" "),e("p",[t._v("In order to access the UI, we have to forward the port of the webserver pod to our local machine.")]),t._v(" "),e("p",[t._v("The is can be done with k9s or directly on the command line:")]),t._v(" "),e("div",{staticClass:"language-bash extra-class"},[e("pre",{pre:!0,attrs:{class:"language-bash"}},[e("code",[t._v("kubectl port-forward "),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("[")]),t._v("POD NAME HERE"),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("]")]),t._v(" "),e("span",{pre:!0,attrs:{class:"token number"}},[t._v("8080")]),t._v(":8080 \n")])])]),e("p",[t._v("Navigate to the "),e("a",{attrs:{href:"http://localhost:8080",target:"_blank",rel:"noopener noreferrer"}},[t._v("login page"),e("OutboundLink")],1),t._v(".")]),t._v(" "),e("div",{staticClass:"custom-block danger"},[e("p",{staticClass:"custom-block-title"},[t._v("WARNING")]),t._v(" "),e("p",[t._v('If you look in the k8s/values.yaml file, you will notice that\nthe username and password are "admin".\nIn production, it needs to be changed, and stored, preferably, in a secret.')])]),t._v(" "),e("h2",{attrs:{id:"important-sections-of-the-ui"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#important-sections-of-the-ui"}},[t._v("#")]),t._v(" Important sections of the UI")]),t._v(" "),e("p",[e("br"),e("br"),t._v(" "),e("a",{staticClass:"zoom",attrs:{href:"../airflow_1.png",target:"_blank"}},[e("img",{attrs:{src:t.$withBase("/airflow_1.png"),alt:"airflow_1"}})]),t._v(" "),e("br"),e("br")]),t._v(" "),e("hr"),t._v(" "),e("p",[e("br"),e("br"),t._v(" "),e("a",{staticClass:"zoom",attrs:{href:"../airflow_1.png",target:"_blank"}},[e("img",{attrs:{src:t.$withBase("/airflow_1.png"),alt:"airflow_1"}})]),t._v(" "),e("br"),e("br")])])}),[],!1,null,null,null);a.default=s.exports}}]);