# Use the official ASP.NET Core runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime

# Set the working directory inside the container
WORKDIR /

# Copy the DLL files into the container
COPY ./ /

# # Expose port 80 for HTTP and 443 for HTTPS
# EXPOSE 8002
# EXPOSE 8443

# Start the application
ENTRYPOINT ["dotnet", "Sports.Api.dll"]
