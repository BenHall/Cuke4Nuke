using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using Cuke4Nuke.Framework;

namespace Cuke4Nuke.Specifications.Core
{
    public class Table_Specification
    {
        [Test]
        public void HashesShouldTreatFirstRowAsHeaders()
        {
            Table table = new Table();
            table.Data.Add(new List<string> { "item", "count" });
            table.Data.Add(new List<string> { "cucumbers", "3" });
            table.Data.Add(new List<string> { "bananas", "5" });
            table.Data.Add(new List<string> { "tomatoes", "2" });

            var hashes = table.Hashes();
            Assert.That(hashes.Count, Is.EqualTo(3));
            Assert.That(hashes[0].Keys, Has.Member("item"));
            Assert.That(hashes[0].Keys, Has.Member("count"));
            Assert.That(hashes[1]["item"], Is.EqualTo("bananas"));
        }

        [Test]
        public void AssertSameAsShouldRaiseDiffEvent()
        {
            Table actualTable = new Table();
            Table expectedTable = new Table();
            bool eventRaised = false;

            actualTable.Diff += delegate(object sender, TableDiffEventArgs e)
            {
                eventRaised = true;
                Assert.AreSame(actualTable, e.ActualTable);
                Assert.AreSame(expectedTable, e.ExpectedTable);
            };

            actualTable.AssertSameAs(expectedTable);

            Assert.That(eventRaised, "Diff event not raised.");
        }
    }
}
