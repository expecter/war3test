/** @noSelfInFile **/
import { adapter } from "./adapter";
import { setAdapter } from "./basic_pragma";
setAdapter(adapter);
export { setPixelScale } from "./AdapterUtil";
export { data } from "./CreateFrameUtil";
export { createElement, Fragment, render, useEffect, useForceUpdate, useRef, useState, } from "./basic_pragma";
/**
 *  use case
 *  import * as React from "solar/w3ts/tsx";
 */
