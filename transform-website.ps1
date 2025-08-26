# PowerShell script to transform Staten Island website to Coralville, IA
# Run this script from the website root directory

Write-Host "Starting website transformation from Staten Island to Coralville, IA..." -ForegroundColor Green

# Define the root path
$rootPath = "c:\Users\Administrator\Desktop\coralville-ductless-mini-splits-main\coralville ductless mini-splits"

# Get all HTML files
$htmlFiles = Get-ChildItem -Path $rootPath -Recurse -Filter "*.html"

Write-Host "Found $($htmlFiles.Count) HTML files to transform..." -ForegroundColor Yellow

# Define replacement mappings
$replacements = @{
    # Basic location replacements
    "Staten Island" = "Coralville"
    "SI Ductless Pro" = "Coralville Ductless Pro"
    "statenislandductless" = "coralvilleductless"
    "Staten Island, NY" = "Coralville, IA"
    "Staten Island NY" = "Coralville IA"
    ", NY" = ", IA"
    " NY " = " IA "
    "New York" = "Iowa"
    
    # Address and contact updates
    "123 Victory Blvd" = "123 Main Street"
    "10301" = "52241"
    "info@statenislandductless.com" = "info@coralvilleductless.com"
    
    # Coordinate updates for schema
    "40.6282" = "41.6764"
    "-74.0776" = "-91.5846"
    
    # Location-specific replacements
    "St. George" = "North Ridge"
    "Stapleton" = "Coral Ridge"
    "Port Richmond" = "Holiday Road"
    "Tottenville" = "Iowa City"
    "Great Kills" = "North Liberty"
    "New Brighton" = "Tiffin"
    "West Brighton" = "University Heights"
    "South Beach" = "Hills"
    "Rosebank" = "Solon"
    "Clifton" = "Oxford"
    "New Dorp" = "Lone Tree"
    "Oakwood" = "Riverside"
    "Bay Terrace" = "Kalona"
    "Castleton Corners" = "West Branch"
    "Willowbrook" = "Swisher"
    "Mariners Harbor" = "Shueyville"
    "Charleston" = "Wellman"
    "Richmond Valley" = "Washington"
    "Pleasant Plains" = "Wellman"
    "Eltingville" = "Amana"
    "Dongan Hills" = "Cedar Rapids"
    "Grant City" = "Marion"
    
    # Geographic and landmark updates
    "Staten Island Ferry" = "University of Iowa"
    "waterfront" = "campus area"
    "harbor" = "Iowa River"
    "ferry terminal" = "University campus"
    "Brooklyn" = "Cedar Rapids"
    "Manhattan" = "Des Moines"
    "New Jersey" = "Cedar Rapids area"
    
    # Climate and regional updates
    "salt air" = "prairie air"
    "maritime" = "continental"
    "coastal" = "midwest"
    "island" = "city"
    "harbor activities" = "university activities"
    
    # Zip code replacements
    "10302" = "52241"
    "10303" = "52241"
    "10304" = "52241"
    "10305" = "52241"
    "10306" = "52241"
    "10307" = "52241"
    "10308" = "52241"
    "10309" = "52241"
    "10310" = "52241"
    "10311" = "52241"
    "10312" = "52241"
    "10313" = "52241"
    "10314" = "52241"
    
    # Business and area specific
    "Coral Ridge Mall" = "Coral Ridge Mall"
    "downtown St. George" = "downtown Coralville"
    "historic brownstones" = "established neighborhoods"
    "Victorian homes" = "family homes"
}

# Process each HTML file
foreach ($file in $htmlFiles) {
    Write-Host "Processing: $($file.Name)" -ForegroundColor Cyan
    
    try {
        $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        $originalContent = $content
        
        # Apply all replacements
        foreach ($find in $replacements.Keys) {
            $replace = $replacements[$find]
            $content = $content -replace [regex]::Escape($find), $replace
        }
        
        # Only write if content changed
        if ($content -ne $originalContent) {
            Set-Content -Path $file.FullName -Value $content -Encoding UTF8
            Write-Host "  ✓ Updated $($file.Name)" -ForegroundColor Green
        } else {
            Write-Host "  - No changes needed for $($file.Name)" -ForegroundColor Gray
        }
    }
    catch {
        Write-Host "  ✗ Error processing $($file.Name): $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`nTransformation completed!" -ForegroundColor Green
Write-Host "Please review the files and make any additional manual adjustments as needed." -ForegroundColor Yellow

# Generate summary report
Write-Host "`nTransformation Summary:" -ForegroundColor Magenta
Write-Host "- Business: Staten Island Ductless Mini Splits → Coralville Ductless Mini Splits" -ForegroundColor White
Write-Host "- Location: Staten Island, NY → Coralville, IA" -ForegroundColor White
Write-Host "- Service Area: NY zip codes → Iowa neighborhoods" -ForegroundColor White
Write-Host "- Contact: statenislandductless.com → coralvilleductless.com" -ForegroundColor White
Write-Host "- Files processed: $($htmlFiles.Count) HTML files" -ForegroundColor White
