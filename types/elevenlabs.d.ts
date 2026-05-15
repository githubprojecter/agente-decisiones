import type React from "react";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            "elevenlabs-convai": React.DetailedHTMLProps<
                React.HTMLAttributes<HTMLElement>,
                HTMLElement
            > & {
                "agent-id"?: string;
                "signed-url"?: string;
                "server-location"?: string;
                variant?: "compact" | "expanded";
                dismissible?: string;
                "action-text"?: string;
                "start-call-text"?: string;
                "end-call-text"?: string;
                "expand-text"?: string;
                "collapse-text"?: string;
                "listening-text"?: string;
                "speaking-text"?: string;
                "override-language"?: string;
                "override-prompt"?: string;
                "override-first-message"?: string;
                "dynamic-variables"?: string;
            };
        }
    }
}

declare module "react" {
    namespace JSX {
        interface IntrinsicElements {
            "elevenlabs-convai": React.DetailedHTMLProps<
                React.HTMLAttributes<HTMLElement>,
                HTMLElement
            > & {
                "agent-id"?: string;
                "signed-url"?: string;
                "server-location"?: string;
                variant?: "compact" | "expanded";
                dismissible?: string;
                "action-text"?: string;
                "start-call-text"?: string;
                "end-call-text"?: string;
                "expand-text"?: string;
                "collapse-text"?: string;
                "listening-text"?: string;
                "speaking-text"?: string;
                "override-language"?: string;
                "override-prompt"?: string;
                "override-first-message"?: string;
                "dynamic-variables"?: string;
            };
        }
    }
}

export { };