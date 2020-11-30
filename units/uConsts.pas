unit uConsts;
{
Copyright 2020 Dmitriy Sosnovich, dmitriy@sosnovich.com

  Permission is hereby granted, free of charge,
  to any person obtaining a copy of this software and associated documentation files (the "Software"),
  to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense,
  and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.}
interface

const
  cPythonInstalledDir = 'D:\Python39\';
  cPythonDll = 'python39.dll';
  cPythonDllFullPath = cPythonInstalledDir + cPythonDll;
  cRowId = 'rowid';
  cOutFolder = './out/';
  cOutFull = cOutFolder+'wmda_xml_full.csv';
  cDropped = cOutFolder+'wmda_xml_%s%s.csv';
  cPandasLib = 'pandas';
  cElementTreeLib = 'xml.etree.ElementTree';
  cOsLib = 'os';
  cDateTimeLib = 'datetime';
  cXPathStart = './';
  cPythonNewStringExpression = 'str(''\n'')';
  cCSVDelimiter = ';';

  cBANK_MANUF_ID = 'BANK_MANUF_ID';
  cBANK_DISTRIB_ID = 'BANK_DISTRIB_ID' ;

  cBANK_ATTRIB_WMDA = 'WMDA';
  cBANK_ATTRIB_EMDIS = 'EMDIS';

implementation

end.

