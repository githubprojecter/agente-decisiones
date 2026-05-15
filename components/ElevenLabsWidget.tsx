"use client";

"use client";

import Script from "next/script";

export default function ElevenLabsWidget() {
    const agentId = process.env.NEXT_PUBLIC_ELEVENLABS_AGENT_ID;

    if (!agentId) {
        return null;
    }

    const dynamicVariables = {
        user_name: "David",
        user_id: "user_demo_001",
        current_objective: "Conseguir 10 leads calificados este mes para OnOffice",
        previous_summary:
            "La última sesión se decidió priorizar una campaña de Facebook antes que rediseñar el sitio.",
        pending_tasks:
            "Crear 5 hooks de campaña, preparar un guion de video comercial y revisar seguimiento de leads anteriores.",
        account_type: "sandbox",
    };

    return (
        <>
            <elevenlabs-convai
                agent-id={agentId}
                variant="compact"
                action-text="Hablar con mi agente"
                start-call-text="Iniciar conversación"
                end-call-text="Terminar"
                expand-text="Abrir agente"
                listening-text="Escuchando..."
                speaking-text="Respondiendo..."
                override-language="es"
                dynamic-variables={JSON.stringify(dynamicVariables)}
            ></elevenlabs-convai>

            <Script
                src="https://unpkg.com/@elevenlabs/convai-widget-embed"
                strategy="afterInteractive"
            />
        </>
    );
}