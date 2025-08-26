#!/usr/bin/env python3
"""
Efficient HTML website transformation script
Transforms Staten Island website to Coralville, IA
"""

import os
import re
from pathlib import Path

def main():
    print("🚀 Starting website transformation from Staten Island to Coralville, IA...")
    
    # Define the root directory
    root_dir = Path(r"c:\Users\Administrator\Desktop\coralville-ductless-mini-splits-main\coralville ductless mini-splits")
    
    # Find all HTML files
    html_files = list(root_dir.rglob("*.html"))
    print(f"📁 Found {len(html_files)} HTML files to process")
    
    # Define replacement mappings
    replacements = {
        # Primary location and business updates
        "Staten Island": "Coralville",
        "SI Ductless Pro": "Coralville Ductless Pro",
        "statenislandductless": "coralvilleductless",
        "Staten Island, NY": "Coralville, IA",
        "Staten Island NY": "Coralville IA",
        
        # Geographic references
        "New York": "Iowa",
        ", NY": ", IA",
        " NY ": " IA ",
        "123 Victory Blvd": "123 Main Street",
        
        # Coordinates (for schema markup)
        "40.6282": "41.6764",
        "-74.0776": "-91.5846",
        
        # Zip codes
        "10301": "52241", "10302": "52241", "10303": "52241", "10304": "52241",
        "10305": "52241", "10306": "52241", "10307": "52241", "10308": "52241",
        "10309": "52241", "10310": "52241", "10311": "52241", "10312": "52241",
        "10313": "52241", "10314": "52241",
        
        # Location-specific neighborhoods
        "St. George": "North Ridge",
        "Stapleton": "Coral Ridge", 
        "Port Richmond": "Holiday Road",
        "Tottenville": "Iowa City",
        "Great Kills": "North Liberty",
        "New Brighton": "Tiffin",
        "West Brighton": "University Heights",
        "South Beach": "Hills",
        "Rosebank": "Solon",
        "Clifton": "Oxford",
        "New Dorp": "Lone Tree",
        "Oakwood": "Riverside",
        "Bay Terrace": "Kalona",
        "Castleton Corners": "West Branch",
        "Willowbrook": "Swisher",
        "Mariners Harbor": "Shueyville",
        "Charleston": "Wellman",
        "Richmond Valley": "Washington",
        "Pleasant Plains": "Wellman",
        "Eltingville": "Amana",
        "Dongan Hills": "Cedar Rapids",
        "Grant City": "Marion",
        
        # Regional and cultural references
        "Staten Island Ferry": "University of Iowa",
        "ferry terminal": "University campus",
        "waterfront": "campus area",
        "harbor": "Iowa River",
        "salt air": "prairie air",
        "maritime": "continental",
        "coastal": "midwest",
        "island": "city",
        "Brooklyn": "Cedar Rapids",
        "Manhattan": "Des Moines",
        "Jersey City": "Cedar Rapids",
        "harbor activities": "university activities",
        "historic brownstones": "established neighborhoods",
        "Victorian homes": "family homes",
        
        # Email
        "info@statenislandductless.com": "info@coralvilleductless.com",
    }
    
    processed_count = 0
    updated_count = 0
    
    # Process each HTML file
    for file_path in html_files:
        try:
            print(f"📄 Processing: {file_path.name}")
            
            # Read file content
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            original_content = content
            
            # Apply replacements
            for old_text, new_text in replacements.items():
                content = content.replace(old_text, new_text)
            
            # Write back if changed
            if content != original_content:
                with open(file_path, 'w', encoding='utf-8') as f:
                    f.write(content)
                print(f"  ✅ Updated {file_path.name}")
                updated_count += 1
            else:
                print(f"  ⏩ No changes needed for {file_path.name}")
            
            processed_count += 1
            
        except Exception as e:
            print(f"  ❌ Error processing {file_path.name}: {str(e)}")
    
    # Print summary
    print(f"\n🎉 Transformation completed!")
    print(f"📊 Summary:")
    print(f"   • Files processed: {processed_count}")
    print(f"   • Files updated: {updated_count}")
    print(f"   • Files unchanged: {processed_count - updated_count}")
    
    print(f"\n🏆 Transformation Details:")
    print(f"   • Business: Staten Island Ductless Mini Splits → Coralville Ductless Mini Splits")
    print(f"   • Location: Staten Island, NY → Coralville, IA") 
    print(f"   • Service Area: NY zip codes → Iowa neighborhoods")
    print(f"   • Contact: statenislandductless.com → coralvilleductless.com")

if __name__ == "__main__":
    main()
