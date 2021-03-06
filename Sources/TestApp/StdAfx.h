// Copyright (C) 2007-2013 Ivan Zhakov.
#pragma once

#define WINVER 0x0500
#define _WIN32_IE 0x0501

#define STRICT

#define VC_EXTRALEAN		// Exclude rarely-used stuff from Windows headers
#if defined(UNICODE) && !defined(_UNICODE)
#define _UNICODE
#endif

#include <windows.h>         // MFC core and standard components
#include <tchar.h>
