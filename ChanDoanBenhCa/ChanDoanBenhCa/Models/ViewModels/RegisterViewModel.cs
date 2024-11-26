﻿using System.ComponentModel.DataAnnotations;

namespace ChanDoanBenhCa.Models.ViewModels
{
    public class RegisterViewModel
    {
        [Required]
        public string? Username { get; set; }

        //[Required]
        //public string? HoTenNnc { get; set; }

        //[Required]
        //[EmailAddress]
        //public string? Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string? Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Mật khẩu không khớp.")]
        public string? ConfirmPassword { get; set; }
    }
}
