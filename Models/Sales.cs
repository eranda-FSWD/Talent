﻿using System;
using System.Collections.Generic;
using System.ComponentModel;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Talent.Models
{
    public partial class Sales
    {
        public int Id { get; set; }

        [DisplayName("Product")]
        public int? ProductId { get; set; }

        [DisplayName("Customer")]
        public int? CustomerId { get; set; }

        [DisplayName("Store")]
        public int? StoreId { get; set; }
        public DateTime? DateSold { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual Product Product { get; set; }
        public virtual Store Store { get; set; }
    }
}
