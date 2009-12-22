using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cuke4Nuke.Framework
{
    public class TableDiffEventArgs : EventArgs
    {
        public Table ActualTable { get; private set; }
        public Table ExpectedTable { get; private set; }
        
        public TableDiffEventArgs(Table actualTable, Table expectedTable)
        {
            this.ActualTable = actualTable;
            this.ExpectedTable = expectedTable;
        }
    }
}
