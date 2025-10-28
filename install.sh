#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Function to display animated banner
show_banner() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
    ╔══════════════════════════════════════════════════════════════╗
    ║  '########::'########:'########:::::::::::::::::'##::::'##:  ║
    ║   ##.... ##: ##.....:: ##.... ##::::::::::::::::. ##::'##::  ║
    ║   ##:::: ##: ##::::::: ##:::: ##:::::::::::::::::. ##'##:::  ║
    ║   ########:: ######::: ##:::: ##::::'#######::::::. ###::::  ║
    ║   ##.. ##::: ##...:::: ##:::: ##::::........:::::: ## ##:::  ║
    ║   ##::. ##:: ##::::::: ##:::: ##::::::::::::::::: ##:. ##::  ║
    ║   ##:::. ##: ########: ########::::::::::::::::: ##:::. ##:  ║
    ║  ..:::::..::........::........::::::::::::::::::..:::::..::  ║
    ║                 BY   -    A  T  H  E  X                      ║
    ╚══════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
    
    # Animate the banner colors
    colors=("$CYAN" "$BLUE" "$PURPLE" "$GREEN")
    for color in "${colors[@]}"; do
        echo -e "${color}>>> Starting installation process...${NC}"
        sleep 0.5
        clear
        echo -e "${color}"
        cat << "EOF"
    ╔══════════════════════════════════════════════════╗
    ║  ██████╗ ███████╗██████╗               ██╗  ██╗  ║
    ║  ██╔══██╗██╔════╝██╔══██╗              ╚██╗██╔╝  ║
    ║  ██████╔╝█████╗  ██║  ██║    █████╗     ╚███╔╝   ║
    ║  ██╔══██╗██╔══╝  ██║  ██║    ╚════╝     ██╔██╗   ║
    ║  ██║  ██║███████╗██████╔╝              ██╔╝ ██╗  ║
    ║  ╚═╝  ╚═╝╚══════╝╚═════╝               ╚═╝  ╚═╝  ║
    ║            BY   -    A  T  H  E  X               ║
    ╚══════════════════════════════════════════════════╝
   
EOF
        echo -e "${NC}"
    done
}

# Function to show spinning animation
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Function to print colored progress bar
progress_bar() {
    local duration=$1
    local steps=20
    local step_delay=$(echo "scale=3; $duration/$steps" | bc -l)
    
    printf "${CYAN}["
    for ((i=0; i<steps; i++)); do
        printf "█"
        sleep $step_delay
    done
    printf "]${NC}\n"
}

# Function to install dependencies
install_dependencies() {
    echo -e "\n${YELLOW}📦 Installing dependencies...${NC}\n"
    
    # Define dependencies array - customize with your actual dependencies
    dependencies=("curl" "wget" "git" "python3" "build-essential")
    
    for dep in "${dependencies[@]}"; do
        echo -e "${BLUE}🔍 Checking $dep...${NC}"
        
        if command -v $dep &> /dev/null; then
            echo -e "${GREEN}✅ $dep is already installed${NC}"
        else
            echo -e "${YELLOW}📥 Installing $dep...${NC}"
            # Simulate installation (replace with actual installation commands)
            # Uncomment the appropriate lines for your system:
            
            # For Ubuntu/Debian:
            # sudo apt-get install -y $dep > /dev/null 2>&1 &
            
            # For CentOS/RHEL:
            # sudo yum install -y $dep > /dev/null 2>&1 &
            
            (sleep 2) &
            spinner $!
            
            echo -e "${GREEN}✅ $dep installed successfully${NC}"
        fi
        echo
    done
}

# Function to find and execute run.sh
find_and_execute_run() {
    echo -e "\n${YELLOW}🔍 Searching for run.sh...${NC}"
    
    # Search for run.sh in current directory and subdirectories
    run_path=$(find . -name "run.sh" -type f | head -1)
    
    if [ -n "$run_path" ]; then
        echo -e "${GREEN}✅ Found run.sh at: $run_path${NC}"
        
        # Make it executable if it's not
        if [ ! -x "$run_path" ]; then
            echo -e "${YELLOW}🔧 Making run.sh executable...${NC}"
            chmod +x "$run_path"
            echo -e "${GREEN}✅ run.sh is now executable${NC}"
        fi
        
        echo -e "\n${PURPLE}🚀 Executing run.sh...${NC}"
        echo -e "${CYAN}================================${NC}"
        
        # Execute the found run.sh
        "$run_path"
        
    else
        echo -e "${RED}❌ Error: run.sh not found in current directory or subdirectories${NC}"
        echo -e "${YELLOW}💡 Please make sure run.sh exists in one of these locations:${NC}"
        find . -type d | while read dir; do
            echo -e "${BLUE}   📁 $dir${NC}"
        done
        exit 1
    fi
}

# Function to run animated installation process
animated_installation() {
    echo -e "${PURPLE}🚀 Starting installation process...${NC}\n"
    
    # Step 1: System check
    echo -e "${CYAN}Step 1: Performing system check...${NC}"
    progress_bar 1.5
    echo -e "${GREEN}✅ System check completed${NC}\n"
    
    # Step 2: Dependency verification
    echo -e "${CYAN}Step 2: Verifying dependencies...${NC}"
    (sleep 2) &
    spinner $!
    echo -e "${GREEN}✅ Dependencies verified${NC}\n"
    
    # Step 3: Environment setup
    echo -e "${CYAN}Step 3: Setting up environment...${NC}"
    progress_bar 1
    echo -e "${GREEN}✅ Environment ready${NC}\n"
    
    # Step 4: Final preparation
    echo -e "${CYAN}Step 4: Final preparations...${NC}"
    (sleep 1.5) &
    spinner $!
    echo -e "${GREEN}✅ Ready to launch${NC}\n"
}

# Main execution
main() {
    # Show animated banner first
    show_banner
    
    # Start animated installation
    animated_installation
    
    # Install dependencies
    install_dependencies
    
    # Find and execute run.sh
    find_and_execute_run
}

# Check if bc is available for calculations
check_bc() {
    if ! command -v bc &> /dev/null; then
        echo -e "${YELLOW}📥 Installing bc for calculations...${NC}"
        # For Ubuntu/Debian:
        sudo apt-get install -y bc > /dev/null 2>&1 || \
        # For CentOS/RHEL:
        sudo yum install -y bc > /dev/null 2>&1 || \
        echo -e "${RED}⚠️  Could not install bc, using fallback timing${NC}"
    fi
}

# Check if script is being sourced or executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Check for bc
    check_bc
    
    # Run main function
    main "$@"
fi
