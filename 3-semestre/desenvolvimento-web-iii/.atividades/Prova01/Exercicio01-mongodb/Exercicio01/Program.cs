using Exercicio01.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Exercicio01.Data;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<Exercicio01Context>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("Exercicio01Context") ?? throw new InvalidOperationException("Connection string 'Exercicio01Context' not found.")));

// Add services to the container.
builder.Services.AddControllersWithViews();

ContextMongoDb.ConnectionString = builder.Configuration.GetSection("MongoConnection:ConnectionString").Value;
ContextMongoDb.Database = builder.Configuration.GetSection("MongoConnection:Database").Value;
ContextMongoDb.IsSSL = Convert.ToBoolean(builder.Configuration.GetSection("MongoConnection:IsSSL").Value);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseRouting();

app.UseAuthorization();

app.MapStaticAssets();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Medicos}/{action=All}/{id?}")
    .WithStaticAssets();


app.Run();
