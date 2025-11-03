using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace makedex.Models
{
    [Table("Maquiagem")]
    public class Maquiagem
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public uint Numero { get; set; }

        [StringLength(30)]
        [Required(ErrorMessage = "Por favor, informe o nome")]
        public string Nome { get; set; }

        [StringLength(1000)]
        public string Descricao { get; set; }

        [Required(ErrorMessage = "Por favor, informe o tipo")]
        public uint TipoId { get; set; }
        [ForeignKey("TipoId")]
        public Tipo Tipo { get; set; }

        [Column(TypeName = "double(7,3)")]
        [Required(ErrorMessage = "Por favor, informe o valor")]
        public double valor { get; set; }

        [StringLength(200)]
        public string Imagem { get; set; }
    }
}
